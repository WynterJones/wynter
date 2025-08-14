#!/bin/bash
# Wynter Stop Hook - Triggers TTS after /wynter commands complete
# Reads dynamic summary from tts.txt if it exists

# Check if this was triggered by a stop hook already (prevent loops)
if [ "$stop_hook_active" = "true" ]; then
    exit 0
fi

# Check if OpenAI API key is set
if [ -z "$OPENAI_API_KEY" ]; then
    exit 0
fi

# Check if there's a transcript to analyze
if [ -z "$transcript_path" ] || [ ! -f "$transcript_path" ]; then
    exit 0
fi

# Check if the last command was a wynter command by looking at the transcript
if ! tail -20 "$transcript_path" | grep -q "/wynter:"; then
    exit 0
fi

# Default summary
DEFAULT_SUMMARY="Wynter task completed"

# Check for dynamic summary file
if [ -f "_ai/tts.txt" ]; then
    SUMMARY=$(head -1 "_ai/tts.txt" | tr -d '\n\r')
    # Clean up the file after reading
    rm -f "_ai/tts.txt"
else
    # Extract command from transcript for more specific summary
    LAST_WYNTER_CMD=$(tail -20 "$transcript_path" | grep "/wynter:" | tail -1 | sed 's|.*/wynter:\([^[:space:]]*\).*|\1|')
    
    case "$LAST_WYNTER_CMD" in
        prd*)
            SUMMARY="PRD generation completed successfully"
            ;;
        plan*)
            SUMMARY="Sprint planning completed successfully"
            ;;
        security*)
            SUMMARY="Security audit completed successfully"
            ;;
        check*)
            SUMMARY="Validation check completed successfully"
            ;;
        enhance*)
            SUMMARY="Feature enhancement completed successfully"
            ;;
        help*)
            SUMMARY="Help documentation displayed successfully"
            ;;
        *)
            SUMMARY="$DEFAULT_SUMMARY"
            ;;
    esac
fi

# Truncate to 5 words max
FIVE_WORD_SUMMARY=$(echo "$SUMMARY" | awk '{print $1, $2, $3, $4, $5}')

# Create TTS audio file
TEMP_FILE="/tmp/wynter_$(date +%s).mp3"

curl -s -X POST https://api.openai.com/v1/audio/speech \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d "{
    \"model\": \"tts-1\",
    \"voice\": \"alloy\",
    \"input\": \"$FIVE_WORD_SUMMARY\"
  }" \
  --output "$TEMP_FILE"

# Play the audio (macOS)
if command -v afplay >/dev/null 2>&1; then
    afplay "$TEMP_FILE" 2>/dev/null
# Play the audio (Linux)
elif command -v mpv >/dev/null 2>&1; then
    mpv "$TEMP_FILE" --no-video --quiet 2>/dev/null
elif command -v ffplay >/dev/null 2>&1; then
    ffplay -nodisp -autoexit "$TEMP_FILE" 2>/dev/null
fi

# Clean up
sleep 2
rm -f "$TEMP_FILE" 2>/dev/null

exit 0