# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a configuration repository for Claude Code that stores custom slash commands, hooks, and instructions for reuse across different machines and projects.

## Architecture

### Command System
- Slash commands are markdown files in `commands/` directory
- Each `.md` file becomes a `/command-name` that can be invoked in Claude Code
- Commands contain natural language instructions for Claude to execute
- The `commands/` directory is symlinked to `~/.claude/commands` for global access

### Directory Structure
- `commands/` - Custom slash commands (active)
- `instructions/` - Instruction files for specific contexts (currently unused)
- `hooks/` - Shell hooks for events (currently unused)
- `examples/` - Example workflows and templates (currently unused)

## Prerequisites

This configuration relies on:
- **GitHub CLI (`gh`)** - Must be installed and authenticated for PR-related commands
- Commands may reference other CLI tools - ensure they're installed before running

## Working with Commands

### Adding a New Command
1. Create `commands/your-command.md`
2. Write clear, step-by-step instructions for Claude
3. The command will be available as `/your-command` after committing

### Modifying Commands
- Edit the markdown file directly
- Changes take effect immediately after saving
- Test commands in Claude Code to verify behavior

### Command Best Practices
- Keep commands focused on a single task
- Use explicit step-by-step instructions
- Reference specific CLI commands when needed (e.g., `gh search prs ...`)
- Include output formatting requirements

## Setup on New Machine

```bash
cd ~/git
git clone https://github.com/mariusfa/claude-config.git
mkdir -p ~/.claude
ln -s ~/git/claude-config/commands ~/.claude/commands
```

After setup, all commands are globally available in any Claude Code session.
