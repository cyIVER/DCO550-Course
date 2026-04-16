#!/usr/bin/env bash
set -euo pipefail

# Verify we are inside a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "Error: Not a git repository. Please initialize git first." >&2
  exit 1
fi

# Exit early if there is nothing to commit
if [[ -z "$(git status --porcelain)" ]]; then
  echo "Nothing to commit; working tree is clean."
  exit 0
fi

# Capture commit message with fallback
MESSAGE="${1:-chore: routine update}"

# Enforce commit message length constraint by truncating
if [[ ${#MESSAGE} -gt 69 ]]; then
  echo "Warning: Commit message truncated to 69 characters."
  MESSAGE="${MESSAGE:0:69}"
fi

# Stage all tracked/untracked changes
echo "Staging changes..."
git add -A

# Guard: status could be dirty but produce no staged diff in edge cases
if git diff --cached --quiet; then
  echo "No staged changes to commit after git add -A."
  exit 0
fi

echo "Committing: '$MESSAGE'"
git commit -m "$MESSAGE"

# Ensure we are on a branch (not detached HEAD)
BRANCH="$(git symbolic-ref --quiet --short HEAD || true)"
if [[ -z "$BRANCH" ]]; then
  echo "Error: Detached HEAD detected. Checkout a branch before pushing." >&2
  exit 1
fi

# Ensure origin exists
if ! git remote get-url origin > /dev/null 2>&1; then
  echo "Error: Remote 'origin' is not configured." >&2
  exit 1
fi

echo "Pushing to origin/$BRANCH..."
git push -u origin "$BRANCH"

echo "Successfully pushed to $BRANCH."
