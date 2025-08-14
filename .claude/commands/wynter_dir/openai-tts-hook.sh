#!/bin/bash
# Wynter TTS Notification Hook
# Plays a 5-word summary of completed task via OpenAI TTS

# Check if OpenAI API key is set
if [ -z "$OPENAI_API_KEY" ]; then
    echo "Warning: OPENAI_API_KEY not set. TTS notifications disabled."
    exit 0
fi

# Generate 5-word summary from the task description
TASK_SUMMARY="$1"
if [ -z "$TASK_SUMMARY" ]; then
    TASK_SUMMARY="Task completed successfully"
fi

# Truncate to 5 words max
FIVE_WORD_SUMMARY=$(echo "$TASK_SUMMARY" | awk '{print $1, $2, $3, $4, $5}')

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
    afplay "$TEMP_FILE"
# Play the audio (Linux)
elif command -v mpv >/dev/null 2>&1; then
    mpv "$TEMP_FILE" --no-video --quiet
elif command -v ffplay >/dev/null 2>&1; then
    ffplay -nodisp -autoexit "$TEMP_FILE" 2>/dev/null
else
    echo "Audio player not found. TTS file saved to: $TEMP_FILE"
fi

# Clean up
sleep 2
rm -f "$TEMP_FILE" 2>/dev/null