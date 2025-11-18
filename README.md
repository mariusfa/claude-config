# Claude Code Configuration

Shared configuration files for Claude Code across different machines and projects.

## 📁 Structure

```
claude-config/
├── commands/                 # Custom slash commands
│   ├── gh-project-tasks.md   # Show assigned GitHub project tasks
│   ├── my-reviews.md         # Show PRs requesting your review
│   └── verify.md             # Pre-commit verification (lint, build, test)
├── scripts/                  # Helper scripts for commands
│   └── gh-project-tasks.sh   # GitHub project tasks fetcher
├── instructions/             # Instruction files (currently unused)
├── hooks/                    # Shell hooks for events (currently unused)
└── examples/                 # Example workflows and templates (currently unused)
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

### `/gh-project-tasks`
Fetch and display active tasks from a GitHub project board that are assigned to you. Automatically filters out completed tasks and groups by status.

**Setup:** Set environment variables (add to `~/.bashrc` or `~/.zshrc`):
```bash
export GH_DEFAULT_PROJECT="Your Project Name"
export GH_DEFAULT_PROJECT_OWNER="your-org-or-username"
```

**Usage:** `/gh-project-tasks` or `/gh-project-tasks "Project Name" "owner"`

### `/my-reviews`
Quickly see all PRs where you're requested as a reviewer. Sorted by age with visual indicators for urgent reviews.

**Usage:** `/my-reviews`

### `/verify`
Run pre-commit verification checks (linting, building, testing) before committing code.

**Usage:** `/verify`

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

## 📚 Additional Resources

See `CLAUDE.md` for detailed guidance on the repository structure and how Claude Code uses these configurations.
