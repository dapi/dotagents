# 🤖 AI Agent Skills Repository

Centralized repository for managing AI agent skills - modular extensions that enhance Claude Code and other AI agents with specialized capabilities, workflows, and domain knowledge.

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/dapi/dotagents.git ~/.agents
cd ~/.agents
```

### 2. Install/Update Everything

```bash
# Just run make - it does everything!
make
```

That's it! This will:
- ✅ Install all skills from `.skill-lock.json`
- ✅ Check for updates
- ✅ Verify installation
- ✅ Show you what's installed

### 3. Start Using

Skills are automatically available to Claude Code once installed. Just start working and Claude will activate relevant skills based on your tasks.

## 📋 Commands

### Super Simple

```bash
make          # Does everything (install, update, check, verify)
make clean    # Clean cache files
```

### Manual Skills Management

```bash
npx skills find [query]     # Search for skills
npx skills add <package>    # Install a new skill
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
# Just run make - it updates everything
make
```

## 🛠️ Troubleshooting

### Skills not working?

```bash
# Just run make again
make
```

### Need to reset everything?

```bash
rm -rf skills/
make
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
