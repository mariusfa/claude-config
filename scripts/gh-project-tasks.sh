#!/bin/bash

# Fetch GitHub project tasks assigned to current user
# Usage: ./gh-project-tasks.sh [project-name] [owner]

# Determine project name and owner
PROJECT_NAME="${1:-$GH_DEFAULT_PROJECT}"
OWNER="${2:-$GH_DEFAULT_PROJECT_OWNER}"

# Validate inputs
if [ -z "$PROJECT_NAME" ]; then
    echo "Error: No project name provided. Set GH_DEFAULT_PROJECT or pass as argument."
    exit 1
fi

if [ -z "$OWNER" ]; then
    echo "Error: No owner provided. Set GH_DEFAULT_PROJECT_OWNER or pass as argument."
    exit 1
fi

# Get current username
USERNAME=$(gh api user --jq .login)

# Find project number
PROJECT_NUMBER=$(gh project list --owner "$OWNER" --format json --limit 200 | jq -r --arg name "$PROJECT_NAME" '.projects[] | select(.title == $name) | .number')

if [ -z "$PROJECT_NUMBER" ]; then
    echo "Error: Project '$PROJECT_NAME' not found under owner '$OWNER'"
    exit 1
fi

# Fetch and filter tasks
gh project item-list "$PROJECT_NUMBER" --owner "$OWNER" --format json --limit 100 | \
jq -r --arg user "$USERNAME" '
  [.items[]
   | select(.assignees | length > 0)
   | select(.assignees[] == $user)
   | select(.status | test("Ferdig") | not)
  ]
  | group_by(.status)
  | map({
      status: .[0].status,
      items: . | sort_by(.content.number) | reverse
    })
  | sort_by(
      if .status | test("Arbeides med") then 0
      elif .status | test("Kan testes") then 1
      elif .status | test("Backlog") then 2
      else 3 end
    )
  | map("## \(.status)\n" + (.items | map("- **#\(.content.number)**: \(.content.title)\n  - Labels: \(.labels | join(", "))\n  - \(.content.url)") | join("\n")) + "\n")
  | join("\n")
'

# Count summary
TOTAL=$(gh project item-list "$PROJECT_NUMBER" --owner "$OWNER" --format json --limit 100 | \
jq --arg user "$USERNAME" '[.items[] | select(.assignees | length > 0) | select(.assignees[] == $user) | select(.status | test("Ferdig") | not)] | length')

echo ""
echo "📊 Total aktive oppgaver: $TOTAL"
