Fetch active tasks from a GitHub project that are assigned to me.

This command runs a bash script that handles all the logic.

Usage:
```bash
~/git/claude-config/scripts/gh-project-tasks.sh
```

The script will:
1. Use $GH_DEFAULT_PROJECT and $GH_DEFAULT_PROJECT_OWNER env vars (or accept parameters)
2. Find the project by name
3. Fetch all items assigned to current user
4. Filter out completed tasks (status contains "Ferdig")
5. Group and sort by status (Arbeides med → Kan testes → Backlog → Other)
6. Display formatted results with issue numbers, titles, labels, and links
7. Show total count of active tasks

Parameters (optional):
- First argument: project name (overrides $GH_DEFAULT_PROJECT)
- Second argument: owner (overrides $GH_DEFAULT_PROJECT_OWNER)

Example:
```bash
~/git/claude-config/scripts/gh-project-tasks.sh "Team aksjehandel" "sparebank1utvikling"
```
