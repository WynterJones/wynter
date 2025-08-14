# Wynter

An AI-powered development framework for Claude Code that transforms ideas into enterprise-grade applications while preventing common development pitfalls.

**Wynter** is inspired by [Gustav](https://github.com/dimitritholen/gustav) but designed specifically for comprehensive project lifecycle management with enhanced security, validation, and intelligent feature enhancement capabilities.

## Core Philosophy

- **YAGNI Principle**: "You Aren't Gonna Need It" - Build only what's necessary
- **Security First**: Every feature must meet security standards from day one
- **Quality Gates**: Systematic validation at every development stage
- **Scope Discipline**: Prevent feature creep and maintain laser focus

## Key Features

### PRD Generator (`/wynter:prd`)
Transform high-level ideas into comprehensive Product Requirements Documents with:
- Market research and competitive analysis
- Technical architecture recommendations
- User stories with acceptance criteria
- Risk assessment and mitigation strategies

### Sprint Planner (`/wynter:plan`)
Convert PRDs into actionable sprint plans featuring:
- Maximum 7 features per MVP (YAGNI enforcement)
- 3-4 tasks per milestone structure
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
- Capacity-aware milestone integration
- Automatic sprint plan updates with backup
- YAGNI principle enforcement

## Quick Start

### Prerequisites

- [Claude Code](https://claude.ai/code) installed and configured
- OpenAI API key (for TTS notifications)
- Git repository initialized

### Installation

1. **Clone Wynter to your project:**
```bash
git clone https://github.com/yourusername/wynter.git
cd wynter
```

2. **Copy Wynter commands to your project:**
```bash
cp -r .claude/commands/wynter* /path/to/your/project/.claude/commands/
cp .claude/settings.json /path/to/your/project/.claude/
```

3. **Set up OpenAI API key for TTS notifications:**
```bash
export OPENAI_API_KEY="your-openai-api-key-here"
```

4. **Make commands executable:**
```bash
chmod +x .claude/commands/wynter
chmod +x .claude/commands/wynter_dir/openai-tts-hook.sh
```

### Basic Usage

1. **Generate a PRD:**
```bash
/wynter:prd "Build a task management app for remote teams"
```

2. **Create sprint plan:**
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

### `/wynter:prd "project description"`
Generate comprehensive Product Requirements Document

**Examples:**
```bash
/wynter:prd "E-commerce platform with AI recommendations"
/wynter:prd "Real-time collaboration whiteboard tool"
/wynter:prd "Healthcare patient management system"
```

**Output Files:**
- `prd.md` - Complete product requirements
- Market analysis and technical recommendations

### `/wynter:plan [options]`
Transform PRD into structured sprint plan

**Options:**
```bash
/wynter:plan                    # Full planning with research
/wynter:plan --research-only    # Tech stack research only  
/wynter:plan --quick           # Fast planning mode
```

**Output Files:**
- `wynter-sprint.json` - Structured sprint plan
- `wynter-deferred.json` - Deferred features
- `wynter-research.md` - Technology research

### `/wynter:security [mode]`
Comprehensive security scanning

**Modes:**
```bash
/wynter:security --full        # Complete security audit
/wynter:security --deps        # Dependencies only
/wynter:security --code        # Code analysis only
/wynter:security --config      # Configuration review
/wynter:security --quick       # Critical vulnerabilities
```

**Output Files:**
- `wynter-security-report.json` - Detailed findings
- `wynter-security-remediation.md` - Fix guidance
- `wynter-security-checklist.md` - Validation checklist

### `/wynter:check [mode]`
Quality assurance and validation

**Modes:**
```bash
/wynter:check --full           # Complete validation
/wynter:check --feature <name> # Single feature validation
/wynter:check --quick          # Essential checks
/wynter:check --deploy         # Pre-deployment check
/wynter:check --regression     # Regression testing
```

**Output Files:**
- `wynter-validation-report.json` - Validation results
- `wynter-validation-summary.md` - Executive summary
- `wynter-test-results.md` - Test outcomes

### `/wynter:enhance "feature description"`
Intelligent feature enhancement

**Modes:**
```bash
/wynter:enhance "Add user notifications"           # Smart enhancement
/wynter:enhance --quick "Simple UI improvement"    # Quick addition
/wynter:enhance --research "Complex integration"   # Research only
/wynter:enhance --defer "Future feature idea"      # Add to backlog
```

**Output Files:**
- Updated `wynter-sprint.json`
- `wynter-enhancement-analysis.md` - Analysis report
- Updated `wynter-deferred.json`

## TTS Notifications Setup

Wynter includes text-to-speech notifications for task completion:

1. **Set OpenAI API key:**
```bash
export OPENAI_API_KEY="your-key-here"
# Add to your ~/.bashrc or ~/.zshrc for persistence
echo 'export OPENAI_API_KEY="your-key-here"' >> ~/.bashrc
```

2. **Test TTS functionality:**
```bash
./wynter-tts-hook.sh "Feature implemented successfully"
```

3. **Configure Claude Code hooks** (optional):
The `.claude/settings.json` file is already configured for automatic TTS notifications.

## File Structure

Wynter creates and manages these files in your project root:

### Project Documents
- `prd.md` - Product Requirements Document
- `wynter-research.md` - Technology research findings

### Sprint Management  
- `wynter-sprint.json` - Active sprint plan and tasks
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
1. **Generate PRD**: `/wynter:prd "project description"`
2. **Create Sprint Plan**: `/wynter:plan`
3. **Implement Features**: Follow sprint plan tasks
4. **Validate Progress**: `/wynter:check --feature <name>`
5. **Security Review**: `/wynter:security --full`
6. **Final Validation**: `/wynter:check --deploy`

### Feature Enhancement Workflow
1. **Research Enhancement**: `/wynter:enhance --research "new feature"`
2. **Integrate Feature**: `/wynter:enhance "approved feature"`
3. **Implement Changes**: Follow updated sprint plan
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

## Contributing

Wynter is designed to be extensible and customizable:

1. **Add new validation rules** in `.claude/commands/wynter_dir/validator.md`
2. **Extend security checks** in `.claude/commands/wynter_dir/security.md`
3. **Customize enhancement logic** in `.claude/commands/wynter_dir/enhance.md`
4. **Add compliance frameworks** to security scanning

## Best Practices

### PRD Creation
- Be specific about target users and use cases
- Include business objectives and success metrics
- Mention technical constraints early
- Consider compliance and security requirements

### Sprint Planning
- Trust the 7-feature MVP limit
- Don't skip the research phase
- Review deferred features regularly
- Maintain milestone capacity discipline

### Security
- Run security scans frequently
- Address critical vulnerabilities immediately
- Follow compliance framework requirements
- Integrate security into development workflow

### Validation
- Validate features as they're completed
- Use appropriate validation modes for context
- Address validation issues promptly
- Maintain test coverage standards

## Troubleshooting

### Common Issues

**Command not found:**
```bash
# Ensure wynter is executable
chmod +x .claude/commands/wynter
```

**TTS not working:**
```bash
# Check OpenAI API key
echo $OPENAI_API_KEY
# Test audio player
afplay /System/Library/Sounds/Ping.aiff  # macOS
mpv --version  # Linux
```

**JSON validation errors:**
```bash
# Check JSON syntax
cat wynter-sprint.json | python -m json.tool
```

**Permission errors:**
```bash
# Fix file permissions
chmod +x .claude/commands/wynter_dir/openai-tts-hook.sh
chmod 644 .claude/commands/wynter_dir/*.md
```

## License

MIT License - see LICENSE file for details.

## Acknowledgments

- Inspired by [Gustav](https://github.com/dimitritholen/gustav) by Dimitri Tholen
- Built for [Claude Code](https://claude.ai/code) by Anthropic
- TTS powered by OpenAI API

---

**Happy building with Wynter!**

For support and questions, check the help system: `/wynter:help`