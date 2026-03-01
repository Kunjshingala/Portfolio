---
description: How to push code and deploy the portfolio
---
# Branching Strategy & Deployment Workflow

This project uses a standard two-branch strategy for safe development and deployment.

## Branches
- `dev`: Active development branch. All code changes, features, and fixes MUST be made here.
- `main`: Production branch. Merging into this branch automatically triggers a GitHub Actions deployment to GitHub Pages.

## Steps to Deploy

1. Ensure you are on the `dev` branch.
   ```bash
   git checkout dev
   ```
2. Make your code changes and commit them.
   ```bash
   git add .
   git commit -m "your message"
   ```
3. Push the changes to the remote `dev` branch.
   ```bash
   git push origin dev
   ```
4. Create a Pull Request from `dev` to `main` using the GitHub CLI.
   ```bash
   // turbo
   gh pr create --base main --head dev --title "Your PR Title" --body "Description of changes"
   ```
5. Merge the Pull Request.
   ```bash
   // turbo
   gh pr merge --merge --delete-branch=false
   ```

**Note:** Never commit directly to `main`. Always route changes through `dev` and a Pull Request.
