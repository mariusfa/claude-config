# Claude Code Configuration

Shared configuration files for Claude Code across different machines and projects.

## 📁 Structure

```
claude-config/
├── commands/           # Custom slash commands
│   ├── my-reviews.md   # Show PRs requesting your review
│   ├── review-pr.md    # Deep dive review of a specific PR
│   └── team-prs.md     # Overview of all team PRs
├── instructions/       # Instruction files (.clauderc content)
│   └── code-review.md  # Code review guidelines
├── hooks/             # Shell hooks for events
└── examples/          # Example workflows and templates
```

## 🚀 Setup

### Option 1: Symlink to global .claude directory (recommended for cross-project use)

```bash
# Create global Claude config directory if it doesn't exist
mkdir -p ~/.claude

# Symlink commands
ln -s ~/git/claude-config/commands ~/.claude/commands

# Symlink instructions
ln -s ~/git/claude-config/instructions ~/.claude/instructions
```

### Option 2: Symlink to project-specific .claude directory

```bash
# In your project root
mkdir -p .claude

# Symlink commands
ln -s ~/git/claude-config/commands .claude/commands

# Or copy specific commands you need
cp ~/git/claude-config/commands/my-reviews.md .claude/commands/
```

### Option 3: Add to .clauderc in your project

```bash
# In your project root
echo "source: ~/git/claude-config/instructions/code-review.md" > .clauderc
```

## 📝 Available Commands

### `/my-reviews`
Quickly see all PRs where you're requested as a reviewer. Sorted by age with visual indicators for urgent reviews.

**Usage:** Just type `/my-reviews` in Claude Code

### `/review-pr`
Perform a comprehensive code review of a specific PR with automated checks and structured feedback.

**Usage:** `/review-pr [PR-URL or number]`

### `/team-prs`
Get a team-wide overview of all open PRs, grouped by status.

**Usage:** `/team-prs`

## 🔧 Customization

### Adding New Commands

1. Create a new `.md` file in `commands/` directory
2. Write the command prompt describing what Claude should do
3. Commit and push changes
4. Pull on other machines to sync

### Prerequisites

- [GitHub CLI (`gh`)](https://cli.github.com/) installed and authenticated
- Claude Code installed

## 🔄 Syncing Across Machines

```bash
cd ~/git/claude-config
git pull
```

That's it! All your machines will have the same commands available.

## 💡 Tips

- Commands are just markdown files with instructions for Claude
- Keep commands focused on a single task
- Use clear, step-by-step instructions
- Commands can use any CLI tools (gh, git, jq, etc.)

## 🤝 Contributing

Feel free to add your own useful commands and share them with the team!
