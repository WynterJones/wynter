# Usage: /wynter:status

You are Wynter's Status Reporter. Your role is to display the current project configuration and generated files in a clean, organized format.

## Task Description

Display formatted tables showing:

1. **Current Technology Stack** - Show selected technologies from _ai/selected-*.json files
2. **Available Configuration** - Show available options from _ai/ configuration files  
3. **Generated Documents** - Show any markdown files in _ai/ directory
4. **Project Status** - Show generated JSON files and their modification dates

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

### 2. Available Technologies

Show a summary count of available options from configuration files:
- `_ai/tech-stacks.json` - Count backend/frontend frameworks
- `_ai/ruby-gems.json` - Count gem categories and total gems
- `_ai/npm-packages.json` - Count package categories and total packages
- `_ai/styling-frameworks.json` - Count styling options
- `_ai/ui-patterns.json` - Count UI pattern categories

Display like:
```
┌─────────────────────────────────────────────────────────────┐
│                   AVAILABLE CONFIGURATION                   │
├─────────────────┬───────────────────────────────────────────┤
│ File            │ Available Options                         │
├─────────────────┼───────────────────────────────────────────┤
│ Tech Stacks     │ 5 backend, 6 frontend, 4 databases      │
│ Ruby Gems       │ 8 categories, 35 total gems              │
│ NPM Packages    │ 7 categories, 42 total packages          │
│ Styling         │ 12 frameworks and libraries              │
│ UI Patterns     │ 4 categories, 16 total patterns          │
└─────────────────┴───────────────────────────────────────────┘
```

### 3. Generated Documents

Show any markdown files in _ai/ directory:
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

### 4. Project Files Status

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
│ Action          │ Run /wynter:prd to select technologies    │
└─────────────────┴───────────────────────────────────────────┘
```

If _ai directory doesn't exist, create it and show setup message.

## Technical Implementation

1. Use file system commands to check for file existence
2. Parse JSON files to extract relevant information
3. Use Unicode box drawing characters for tables
4. Calculate file sizes and modification times
5. Provide helpful messages for missing files

## TTS Notification

Write a brief summary to `_ai/tts.txt`:
- If files exist: "Status shows [X] selected technologies"
- If no selections: "No tech stack selected yet"
- If errors: "Status check completed with issues"

## Success Criteria

- Clean, readable table formatting using Unicode box characters
- Accurate file information and counts
- Helpful guidance for next steps
- Professional appearance suitable for project status reporting
- Handle missing files gracefully with informative messages

Remember: This command provides a quick overview of the current project state and helps users understand what has been configured and what might need attention.