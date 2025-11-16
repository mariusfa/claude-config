Show an overview of all open PRs in the current repository or organization.

Steps:
1. Detect if we're in a git repository
2. If yes, run: gh pr list --state open --json number,title,author,createdAt,reviewDecision,isDraft
3. If not in a repo, ask the user for an organization or repository
4. Group PRs by status:
   - ✅ Approved (ready to merge)
   - 👀 Awaiting review
   - ✏️  Draft
   - ⚠️  Changes requested
5. Sort within each group by age (oldest first)
6. Highlight PRs older than 7 days

Provide statistics at the end (total, by status, average age).
