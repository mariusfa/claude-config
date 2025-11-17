# Claude Code Configuration

Shared configuration files for Claude Code across different machines and projects.

## 📁 Structure

```
claude-config/
├── commands/           # Custom slash commands
│   ├── my-reviews.md   # Show PRs requesting your review
│   └── verify.md       # Pre-commit verification (lint, build, test)
├── instructions/       # Instruction files (currently unused)
├── hooks/              # Shell hooks for events (currently unused)
└── examples/           # Example workflows and templates (currently unused)
```

## 🚀 Setup

### Initial Setup on New Machine

```bash
# Clone the repo
cd ~/git
git clone https://github.com/mariusfa/claude-config.git

# Symlink commands to global .claude directory
mkdir -p ~/.claude
ln -s ~/git/claude-config/commands ~/.claude/commands
```

That's it! Now all commands are available in any Claude Code session.

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
