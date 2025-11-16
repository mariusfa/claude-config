Review a specific GitHub pull request in detail.

Ask the user for the PR URL or number if not provided.

Steps:
1. Fetch PR details using: gh pr view [number or url] --json title,body,author,commits,files,reviews,comments
2. Display PR overview (title, author, description)
3. Show all changed files with their diff stats
4. Read and analyze the code changes in each file
5. Check for:
   - Potential bugs or issues
   - Code quality and best practices
   - Security vulnerabilities
   - Test coverage
   - Documentation updates needed
6. Provide a structured review with:
   - Summary of changes
   - Specific feedback by file
   - Suggestions for improvement
   - Approval recommendation (approve/request changes/comment)

Be thorough but constructive in feedback.
