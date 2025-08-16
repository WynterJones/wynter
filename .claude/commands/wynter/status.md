# Usage: /wynter:status

You are Wynter's Status Reporter. Your role is to display the current project configuration and generated files in a clean, organized format.

## Task Description

Display formatted tables showing:

1. **Current Technology Stack** - Show selected technologies from \_ai/selected-\*.json files
2. **Generated Documents** - Show any markdown files in \_ai/ directory
3. **Project Status** - Show generated JSON files and their modification dates

## Implementation Instructions

### 1. Technology Stack Status

Check for and display selected technologies from these files:

- `_ai/selected-tech-stack.json` - Selected backend/frontend frameworks and databases
- `_ai/selected-gems.json` - Selected Ruby gems (if Rails project)
- `_ai/selected-packages.json` - Selected NPM packages (if Node.js project)
- `_ai/selected-styling.json` - Selected styling frameworks
- `_ai/selected-ui-patterns.json` - Selected UI patterns

Display in a table format like:

```
┌─────────────────────────────────────────────────────────────┐
│                    SELECTED TECHNOLOGY STACK                │
├─────────────────┬───────────────────────────────────────────┤
│ Category        │ Selection                                 │
├─────────────────┼───────────────────────────────────────────┤
│ Backend         │ Ruby on Rails                            │
│ Frontend        │ Next.js                                  │
│ Database        │ PostgreSQL                               │
│ Styling         │ Tailwind CSS                             │
│ UI Patterns     │ Header + Sidebar + Main                  │
└─────────────────┴───────────────────────────────────────────┘
```

### 2. Generated Documents

Show any markdown files in \_ai/ directory:

```
┌─────────────────────────────────────────────────────────────┐
│                    GENERATED DOCUMENTS                      │
├─────────────────┬───────────────┬───────────────────────────┤
│ Document        │ Size          │ Last Modified             │
├─────────────────┼───────────────┼───────────────────────────┤
│ prd.md          │ 15.2 KB       │ 2025-08-14 10:30 AM      │
│ research.md     │ 8.7 KB        │ 2025-08-14 09:15 AM      │
└─────────────────┴───────────────┴───────────────────────────┘
```

### 3. Project Files Status

Show generated JSON files and their status:

```
┌─────────────────────────────────────────────────────────────┐
│                      PROJECT STATUS                         │
├─────────────────┬───────────────┬───────────────────────────┤
│ File            │ Status        │ Last Modified             │
├─────────────────┼───────────────┼───────────────────────────┤
│ sprint.json     │ ✅ Current    │ 2025-08-14 11:00 AM      │
│ deferred.json   │ ✅ Current    │ 2025-08-14 10:45 AM      │
│ security.json   │ ⚠️  Outdated  │ 2025-08-13 02:30 PM      │
└─────────────────┴───────────────┴───────────────────────────┘
```

## Error Handling

If no selected technology files exist, show:

```
┌─────────────────────────────────────────────────────────────┐
│                    SELECTED TECHNOLOGY STACK                │
├─────────────────┬───────────────────────────────────────────┤
│ Status          │ No technologies selected yet              │
│ Action          │ Run /wynter:start to select technologies    │
└─────────────────┴───────────────────────────────────────────┘
```

If \_ai directory doesn't exist, create it and show setup message.

## Technical Implementation

1. **Create \_ai directory if it doesn't exist** using `mkdir -p _ai`
2. Use file system commands to check for file existence
3. Parse JSON files to extract relevant information
4. Use Unicode box drawing characters for tables
5. Calculate file sizes and modification times
6. Provide helpful messages for missing files
7. **Handle TTS file creation with error checking**

## TTS Notification

**IMPORTANT**: Only create TTS notification if the analysis completes successfully.

1. **Ensure \_ai directory exists**: Create it if needed
2. **Write brief summary to `_ai/tts.txt`** (only if no errors occurred):

   - If files exist: "Status shows [X] selected technologies"
   - If no selections: "No tech stack selected yet"
   - If errors: "Status check completed with issues"

3. **Handle write failures gracefully**: If writing to `_ai/tts.txt` fails, continue without TTS notification

**Note**: The TTS system will automatically skip if OpenAI API key is not set.

## Success Criteria

- Clean, readable table formatting using Unicode box characters
- Accurate file information and counts
- Helpful guidance for next steps
- Professional appearance suitable for project status reporting
- Handle missing files gracefully with informative messages

Remember: This command provides a quick overview of the current project state and helps users understand what has been configured and what might need attention.
