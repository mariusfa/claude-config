Verify the project is ready for commit by running appropriate checks based on project type.

## Detection and Execution Strategy

1. **Detect project type** by checking for these files (in order):
   - `package.json` → React/Node project
   - `go.mod` or `*.go` files → Go project
   - `pom.xml` → Maven project (skip verification for now)

2. **For React/Node projects:**
   - Read package.json and look for these scripts in the "scripts" section
   - Run scripts in this order if they exist:
     a. Prettier: Look for `format`, `prettier`, or `format:write` scripts
        - Prefer scripts with "write" in the name over "check"
        - Example: `npm run format:write` over `npm run format:check`
     b. Lint: Look for `lint:fix`, `lint`, or `eslint` scripts
        - Prefer scripts with "fix" in the name over plain lint
        - Example: `npm run lint:fix` over `npm run lint`
     c. Type checking: Look for `type-check`, `types`, or `tsc` scripts
     d. Build: Look for `build` script
     e. Tests: Look for `test` script
   - Skip any script that doesn't exist
   - Report each step clearly with ✅/❌ status
   - If any step fails, show the error and stop

3. **For Go projects:**
   - Run these commands in order:
     a. `go fmt ./...` (auto-fix formatting)
     b. `go vet ./...` (check for issues)
     c. `go build ./...` (verify it compiles)
     d. `go test ./...` (run tests)
   - Report each step clearly with ✅/❌ status
   - If any step fails, show the error and suggest fixes

4. **For Maven projects:**
   - Skip verification for now (can be added later if needed)

## Output Format

Show results like this:
```
🔍 Detected: [React/Go/Maven] project

Running verification steps:
✅ Prettier (npm run format:write)
✅ Lint (npm run lint:fix)
✅ Type check (npm run type-check)
✅ Build (npm run build)
✅ Tests (npm run test)

✨ All checks passed! Ready to commit.
```

If a step fails:
```
❌ Build failed (npm run build)
Error: [show error message]

Suggested fix: [provide actionable suggestion]
```

## Important Notes
- Always prefer write/fix operations over check operations
- Stop on first failure and provide clear guidance
- Don't make assumptions about script names - read them from package.json
- For unknown project types, inform the user and list detected files
