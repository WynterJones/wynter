# Plan. Build. No timeline, just vibes.

<img src="/tmp/screenshot.png" width="700"/>

A flow framework for **Claude Code**. Designed after 20+ years of building software.

# Table of Contents

- [Core Philosophy](#core-philosophy)
- [Key Features](#key-features)
- [Quick Start](#quick-start)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Basic Usage](#basic-usage)
- [Command Reference](#command-reference)
  - [/wynter:start](#wynterprd-project-description)
  - [/wynter:plan](#wynterplan-options)
  - [/wynter:security](#wyntersecurity-mode)
  - [/wynter:check](#wyntercheck-mode)
  - [/wynter:enhance](#wynterenhance-feature-description)
  - [/wynter:status](#wynterstatus)
- [TTS Notifications Setup](#tts-notifications-setup)
- [File Structure](#file-structure)
  - [The \_ai Directory](#the-_ai-directory)
  - [Project Documents](#project-documents)
  - [Flow Management](#flow-management)
  - [Quality Assurance](#quality-assurance)
  - [Security](#security)
  - [Enhancement Tracking](#enhancement-tracking)
- [Recommended Workflows](#recommended-workflows)
- [Security & Compliance](#security--compliance)
- [Customizing Technology Preferences](#customizing-technology-preferences)
- [Contributing](#contributing)
- [Best Practices](#best-practices)
- [License](#license)

## Core Philosophy

- **Idea 2 Setup**: No need to write a PRD, just describe your idea and Wynter will do the rest.
- **YAGNI Principle**: "You Aren't Gonna Need It" - Build only what's necessary
- **Security First**: Every feature must meet security standards from day one
- **Quality Checks**: Systematic validation at every development stage
- **Scope Discipline**: Prevent feature creep and maintain laser focus

## Key Features

### PRD Generator (`/wynter:start`)

Transform high-level ideas into comprehensive Product Requirements Documents with:

- Interactive technology stack selection
- Market research and competitive analysis
- Customized technical architecture recommendations
- User stories with acceptance criteria
- Risk assessment and mitigation strategies
- Preference-based package and framework suggestions

### Flow Planner (`/wynter:plan`)

Convert PRDs into actionable development flows featuring:

- Maximum 7 features per MVP (YAGNI enforcement)
- 3-4 tasks per stream structure
- Parallel tech stack research agents
- Built-in scope protection mechanisms

### Security Auditor (`/wynter:security`)

Comprehensive security scanning with:

- 5-8 parallel security analysis agents
- OWASP, GDPR, SOC 2, HIPAA, PCI DSS compliance
- Automated remediation recommendations
- Multiple scanning modes (full, deps, code, config, quick)

### Validator & Double-Checker (`/wynter:check`)

Quality assurance across 6 validation categories:

- Functional validation
- Technical validation
- Security validation
- Performance validation
- Testing validation
- User experience validation

### Feature Enhancer (`/wynter:enhance`)

Intelligent feature integration with:

- Dependency analysis and optimal placement
- Capacity-aware stream integration
- Automatic flow plan updates with backup
- YAGNI principle enforcement

## Quick Start

### Prerequisites

- [Claude Code](https://claude.ai/code) installed and configured
- OpenAI API key (for TTS notifications)
- Git repository initialized

### Installation

1. Copy the `.claude/commands/wynter/` directory to your project
2. Copy the `_ai/` directory to your project
3. Set up OpenAI API key: `export OPENAI_API_KEY="your-key"`
4. Make commands executable:
   ```bash
   chmod +x .claude/commands/wynter/wynter.sh
   chmod +x .claude/commands/wynter/wynter-stop-hook.sh
   ```

### Basic Usage

1. **Generate a PRD:**

```bash
/wynter:start "Build a task management app for remote teams"
```

2. **Create flow plan:**

```bash
/wynter:plan
```

3. **Run security audit:**

```bash
/wynter:security --full
```

4. **Validate implementation:**

```bash
/wynter:check --feature "user-authentication"
```

5. **Enhance with new features:**

```bash
/wynter:enhance "Add dark mode toggle"
```

## Command Reference

### `/wynter:start "project description"`

Generate comprehensive Product Requirements Document

```bash
/wynter:start "E-commerce platform with AI recommendations"
/wynter:start "Real-time collaboration whiteboard tool"
/wynter:start "Healthcare patient management system"
```

Creates: `prd.md`, market analysis, tech recommendations

### `/wynter:plan [options]`

Transform PRD into structured development flow

```bash
/wynter:plan                    # Full planning with research
/wynter:plan --research-only    # Tech stack research only
/wynter:plan --quick           # Fast planning mode
```

Creates: `wynter-flow.json`, `wynter-deferred.json`, `wynter-research.md`

### `/wynter:security [mode]`

Comprehensive security scanning

```bash
/wynter:security --full        # Complete security audit
/wynter:security --deps        # Dependencies only
/wynter:security --code        # Code analysis only
/wynter:security --config      # Configuration review
/wynter:security --quick       # Critical vulnerabilities
```

Creates: `wynter-security-report.json`, `wynter-security-remediation.md`, `wynter-security-checklist.md`

### `/wynter:check [mode]`

Quality assurance and validation

```bash
/wynter:check --full           # Complete validation
/wynter:check --feature <name> # Single feature validation
/wynter:check --quick          # Essential checks
/wynter:check --deploy         # Pre-deployment check
/wynter:check --regression     # Regression testing
```

Creates: `wynter-validation-report.json`, `wynter-validation-summary.md`, `wynter-test-results.md`

### `/wynter:enhance "feature description"`

Intelligent feature enhancement

```bash
/wynter:enhance "Add user notifications"           # Smart enhancement
/wynter:enhance --quick "Simple UI improvement"    # Quick addition
/wynter:enhance --research "Complex integration"   # Research only
/wynter:enhance --defer "Future feature idea"      # Add to backlog
```

Updates: `wynter-flow.json`, creates `wynter-enhancement-analysis.md`, updates `wynter-deferred.json`

### `/wynter:status`

Show current project configuration and files in formatted tables

```bash
/wynter:status                              # Show complete project status
```

Displays: Technology stack, generated documents, project file status

<img src="/tmp/status.png" width="700"/>

## TTS Notifications Setup

Wynter provides spoken notifications when commands complete.

**Setup:**

1. Set OpenAI API key: `export OPENAI_API_KEY="your-key"`
2. The `.claude/settings.json` file handles the rest automatically

**How it works:**

- Each command writes a summary to `_ai/tts.txt`
- The stop hook reads this file and speaks it
- Examples: "PRD completed", "Security scan found 3 issues"
- Uses OpenAI TTS-1 with "alloy" voice
- Works on macOS and Linux

## File Structure

### The \_ai Directory

Wynter uses the `_ai/` directory to store configuration files, generated documents, and temporary data. This directory contains two types of files:

**Configuration Files (You Can Edit):**

- `tech-stacks.json` - Available frameworks and databases for PRD generation
- `ruby-gems.json` - Ruby gem options organized by category
- `npm-packages.json` - NPM package options organized by category
- `styling-frameworks.json` - CSS frameworks and component libraries
- `ui-patterns.json` - UI/UX patterns and layout approaches

**Generated Files (Wynter Creates These):**

- `selected-*.json` - Your chosen technologies from PRD generation
- `tts.txt` - Current TTS notification message
- Various output files from commands (see sections below)

The configuration files let you customize what technologies Wynter suggests during PRD generation. The generated files store your selections and command outputs.

### Project Documents

- `prd.md` - Product Requirements Document
- `wynter-research.md` - Technology research findings

### Flow Management

- `wynter-flow.json` - Active development flow and tasks
- `wynter-deferred.json` - Deferred features and future planning

### Quality Assurance

- `wynter-validation-report.json` - Validation results
- `wynter-validation-summary.md` - Validation summary
- `wynter-test-results.md` - Test execution results

### Security

- `wynter-security-report.json` - Security scan results
- `wynter-security-remediation.md` - Security fix guidance
- `wynter-security-checklist.md` - Security validation checklist

### Enhancement Tracking

- `wynter-enhancement-analysis.md` - Feature enhancement analysis

## Recommended Workflows

### New Project Workflow

1. **Generate PRD**: `/wynter:start "project description"`
2. **Create Flow Plan**: `/wynter:plan`
3. **Implement Features**: Follow flow plan tasks
4. **Validate Progress**: `/wynter:check --feature <name>`
5. **Security Review**: `/wynter:security --full`
6. **Final Validation**: `/wynter:check --deploy`

### Feature Enhancement Workflow

1. **Research Enhancement**: `/wynter:enhance --research "new feature"`
2. **Integrate Feature**: `/wynter:enhance "approved feature"`
3. **Implement Changes**: Follow updated flow plan
4. **Validate Integration**: `/wynter:check --regression`
5. **Security Check**: `/wynter:security --code`

### Continuous Quality Workflow

1. **Daily Security**: `/wynter:security --quick` (in CI/CD)
2. **Feature Validation**: `/wynter:check --feature <name>` (after implementation)
3. **Weekly Full Check**: `/wynter:check --full`
4. **Pre-deployment**: `/wynter:check --deploy` + `/wynter:security --full`

## Security & Compliance

Wynter supports multiple security frameworks:

- **OWASP Top 10** - Web application security risks
- **GDPR** - Data protection and privacy compliance
- **SOC 2** - Service organization controls
- **HIPAA** - Healthcare data protection
- **PCI DSS** - Payment card industry standards
- **NIST** - Cybersecurity framework

## Customizing Technology Preferences

Wynter suggests technologies based on files in the `_ai/` directory. You can edit these to match your preferences:

**Configuration Files:**

- `tech-stacks.json` - Frameworks and databases
- `ruby-gems.json` - Ruby gems by category
- `npm-packages.json` - NPM packages by category
- `styling-frameworks.json` - CSS frameworks and UI libraries
- `ui-patterns.json` - UI/UX patterns and layouts

**Adding New Options:**

1. Edit the JSON files in `_ai/`
2. Follow the existing structure with name, description, use_cases, popularity
3. Wynter will present your options during PRD generation
4. Your selections are remembered for future projects

**Example structure:**

```json
{
  "category_name": [
    {
      "name": "package-name",
      "description": "What this package does",
      "use_cases": ["case1", "case2"],
      "popularity": "high|medium|low"
    }
  ]
}
```

## Contributing

Wynter is designed to be extensible:

- Add validation rules in `.claude/commands/wynter/validator.md`
- Extend security checks in `.claude/commands/wynter/security.md`
- Customize enhancement logic in `.claude/commands/wynter/enhance.md`
- Add compliance frameworks to security scanning
- Submit PRs with new technology preferences

## Best Practices

**PRD Creation:**

- Be specific about target users and use cases
- Include business objectives and success metrics
- Mention technical constraints and compliance needs

**Flow Planning:**

- Trust the 7-feature MVP limit
- Don't skip the research phase
- Review deferred features regularly

**Security:**

- Run security scans frequently
- Address critical vulnerabilities immediately
- Follow compliance requirements

**Validation:**

- Validate features as completed
- Use appropriate modes for context
- Address issues promptly

## License

MIT License

## Inspiration

> **Wynter** is inspired by [Gustav](https://github.com/dimitritholen/gustav)
