# Claude Code Skills Integration

Instructions for Claude Code on how to work with this skills repository.

## Repository Context

This is the central skills management repository for your AI agent capabilities. Skills are modular extensions that provide:

- **Specialized Knowledge**: Domain-specific expertise (React, testing, deployment, etc.)
- **Structured Workflows**: Step-by-step processes for complex tasks
- **Tool Integration**: Pre-configured tool chains and automation
- **Best Practices**: Curated patterns and conventions

## How Skills Work

### Automatic Activation

You (Claude) automatically activate skills based on:

1. **Keywords**: User mentions specific tools or domains
2. **File Types**: Project structure indicates relevant skills
3. **Task Patterns**: User requests match skill capabilities
4. **Explicit Invocation**: User directly requests a skill

### Skill Discovery

When a user asks "how do I do X" or "is there a skill for X":

1. Use the `find-skills` skill to search the catalog
2. Present relevant options with descriptions
3. Offer to install if the user is interested
4. The `.skill-lock.json` will be updated automatically

## Working with Skills

### Reading Skill Documentation

Each skill has a `SKILL.md` file with:
- Description and when to use it
- Workflow steps
- Examples and best practices
- Tool integrations

**Always read the full SKILL.md before using a skill.**

### Skill Installation Workflow

When user wants a new skill:

```bash
# Search for the skill
npx skills find [query]

# Install it
npx skills add <package>

# Verify installation
npx skills list
```

The `.skill-lock.json` will be automatically updated.

### Skill Updates

Periodically remind users to update skills:

```bash
make check    # Check for updates
make update   # Apply updates
```

## Best Practices

### 1. Skill Selection

- **Prefer specific skills over generic knowledge**: If a skill exists for the task, use it
- **Check installed skills first**: Review `skills/` directory
- **Suggest relevant skills**: If a task would benefit from a skill, recommend it

### 2. Skill Execution

- **Follow the workflow**: Each skill has a documented process - follow it
- **Read documentation first**: Don't assume - read the SKILL.md
- **Validate prerequisites**: Check if required tools are installed
- **Report issues**: If a skill doesn't work, inform the user

### 3. Skill Maintenance

- **Commit lock file changes**: When skills are added/updated, commit `.skill-lock.json`
- **Don't modify skill files**: Skills are managed externally, don't edit them
- **Suggest updates**: Periodically recommend `make check` to users

## Common Workflows

### New User Setup

When user first clones this repo:

```bash
# 1. Navigate to repo
cd ~/.agents

# 2. Install all skills
make install

# 3. Verify installation
npx skills list
```

### Adding a Skill

```bash
# 1. Search
npx skills find [query]

# 2. Add
npx skills add <package>

# 3. Commit
git add .skill-lock.json
git commit -m "Add <skill-name> skill"
```

### Updating Skills

```bash
# 1. Check for updates
make check

# 2. Update all
make update

# 3. Commit if changes
git add .skill-lock.json
git commit -m "Update skills"
```

## Integration with SuperClaude Framework

This skills repository complements the SuperClaude framework configuration in `~/.claude/`:

- **SuperClaude**: Core behavioral modes and MCP server integration
- **Skills**: Task-specific workflows and domain knowledge

Skills can leverage SuperClaude modes:
- Use `--brainstorm` before complex skill execution
- Use `--think` for skill planning
- Use MCP servers (Sequential, Magic, etc.) within skills

## Troubleshooting

### Skill Not Activating

1. Check if skill is installed: `npx skills list`
2. Read the skill's activation triggers in its SKILL.md
3. Try explicit invocation: "Use the [skill-name] skill to..."

### Skill Execution Fails

1. Read the full SKILL.md documentation
2. Check prerequisites (tools, environment variables)
3. Verify the skill is up to date: `make check`
4. Try reinstalling: `npx skills add <package> --force`

### Lock File Conflicts

If `.skill-lock.json` has merge conflicts:

```bash
# Keep their version (usually safer)
git checkout --theirs .skill-lock.json

# Reinstall to verify
make install
```

## File Exclusions

The `.gitignore` excludes:
- `skills/` directory (managed by skills CLI)
- Any temporary or cache files

**Only commit**: `.skill-lock.json` changes

## Skill Development

If creating custom skills:

1. Create in a separate repo following Skills CLI format
2. Add frontmatter with name, description, activation triggers
3. Document workflows, examples, prerequisites
4. Test thoroughly before sharing
5. Submit to skills.sh catalog if useful to others

## Remember

- **Skills are versioned**: The lock file ensures reproducibility
- **Skills are composable**: Use multiple skills together
- **Skills evolve**: Regular updates bring improvements
- **Skills are discoverable**: Catalog at skills.sh grows constantly

---

**Your role**: Use skills to enhance your capabilities and help users accomplish complex tasks efficiently. Always prioritize skill-based workflows over generic approaches when relevant skills exist.
