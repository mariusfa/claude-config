Use the gh CLI to fetch all pull requests where I am requested as a reviewer.

Steps:
1. Run: gh search prs --review-requested=@me --state=open --json number,title,repository,url,author,createdAt,updatedAt
2. Parse and display the results in a clear, formatted table
3. Sort by creation date (oldest first)
4. Highlight any PRs older than 3 days with a ⚠️  symbol
5. Show the total count at the end

Format each PR as:
- **[Repo/Owner] PR #number**: Title
- Author: @username | Created: date | Updated: date
- Link: direct URL

After displaying all PRs, provide a summary with actionable next steps.
