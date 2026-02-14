# 🤖 AI Agent Skills Repository

Centralized repository for managing AI agent skills - modular extensions that enhance Claude Code and other AI agents with specialized capabilities, workflows, and domain knowledge.

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone <your-repo-url> ~/.agents
cd ~/.agents
```

### 2. Install Skills

```bash
# Using make (recommended)
make install

# Or manually
npx skills check
npx skills update
```

### 3. Start Using

Skills are automatically available to Claude Code once installed. Just start working and Claude will activate relevant skills based on your tasks.

## 📋 Available Commands

### Using Make

```bash
make install    # Install/restore all skills from .skill-lock.json
make update     # Update all installed skills
make check      # Check for available updates
make find       # Search for new skills interactively
make clean      # Clean cache and temporary files
make help       # Show all available commands
```

### Using Skills CLI Directly

```bash
npx skills find [query]     # Search for skills
npx skills add <package>    # Install a new skill
npx skills check            # Check for updates
npx skills update           # Update all skills
npx skills list             # List installed skills
```

## 📁 Repository Structure

```
.agents/
├── README.md              # This file
├── CLAUDE.md              # Claude Code specific instructions
├── Makefile               # Automation commands
├── .skill-lock.json       # Installed skills registry (like package-lock.json)
├── .gitignore             # Git exclusions
└── skills/                # Installed skills directory
    ├── skill-name-1/      # Individual skill folder
    ├── skill-name-2/
    └── ...
```

## 🔍 Finding Skills

### Browse the Catalog

Visit **[skills.sh](https://skills.sh/)** to explore available skills.

### Search from Terminal

```bash
# Interactive search
make find

# Search by keyword
npx skills find testing
npx skills find react
npx skills find deployment
```

### Popular Categories

- **Development**: Testing, debugging, code review
- **Design**: UI/UX, design systems, accessibility
- **DevOps**: Deployment, CI/CD, infrastructure
- **Documentation**: ADR, API docs, technical writing
- **Automation**: Browser testing, workflows, scripts

## 💡 How Skills Work

1. **Installation**: Skills are downloaded from GitHub repositories
2. **Registry**: `.skill-lock.json` tracks installed skills (version controlled)
3. **Activation**: AI agents automatically detect and activate relevant skills
4. **Updates**: Regular updates ensure you have the latest capabilities

## 🔄 Keeping Skills Up to Date

```bash
# Check for updates (recommended weekly)
make check

# Update all skills
make update

# Or do both in one command
make check update
```

## 🛠️ Troubleshooting

### Skills not working?

```bash
# Reinstall all skills
make clean
make install
```

### Need to reset everything?

```bash
# Remove all skills and reinstall
rm -rf skills/
make install
```

### Skills CLI not found?

Make sure you have Node.js installed:

```bash
node --version  # Should be v18+
```

## 📚 Learn More

- **Skills Catalog**: [skills.sh](https://skills.sh/)
- **Claude Code**: [claude.com/claude-code](https://claude.com/claude-code)
- **Skills CLI**: [github.com/vercel-labs/skills](https://github.com/vercel-labs/skills)

## 🤝 Contributing

### Adding New Skills

1. Find skills: `make find` or browse [skills.sh](https://skills.sh/)
2. Install: `npx skills add <package>`
3. Test the skill with your agent
4. Commit the updated `.skill-lock.json`

### Creating Custom Skills

Skills are just markdown files with YAML frontmatter. See existing skills in `skills/` for examples.

## 📝 License

This repository configuration is open source. Individual skills are licensed by their respective authors.

---

**Next Steps**: Read [CLAUDE.md](./CLAUDE.md) for Claude Code specific workflows and best practices.
