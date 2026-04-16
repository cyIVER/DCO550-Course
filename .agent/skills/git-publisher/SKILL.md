---
name: git-publisher
description: "Analyzes uncommitted changes, formats a Conventional Commit message, stages, and pushes to the remote branch. Use when the user wants to save, commit, or push their work."
---

# Git Smart Commit & Push Workflow

## Goal
To safely stage all code changes, generate a structured Conventional Commit message based on the actual modifications, and automatically push it to the remote repository.

## When to Use This Skill
* When the user asks to save their work, push their changes, or commit their code.
* When the user uses phrases like "ship it", "commit this", or "push to origin".

## Execution Protocol (Checklist)

You must process the following implementation steps sequentially. Do not proceed to a subsequent step until the current step is fully executed, verified, and its state is recorded.

### [ ] Phase 1: Context Analysis
1. Inspect the current working context using `git status` and `git diff` to understand exactly what files were modified.

### [ ] Phase 2: Message Generation
1. Generate a strictly formatted Conventional Commit message based on the changes.
    * **Format:** `<type>[optional scope]: <description>`
    * **Length:** MUST be less than 69 characters. Be concise but descriptive.
    * **Types:** `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `chore`
    * **Example:** `feat(ingestion): add crawl4ai support for dynamic JS sites`

### [ ] Phase 3: Execution
1. Pass the generated message as an argument to the smart commit script implicitly.
    * Command: `bash scripts/smart_commit.sh "<GENERATED_MESSAGE>"`

### [ ] Phase 4: Verification
1. Confirm success with the user and briefly state what was committed.

## Constraints & Non-Negotiables
* **DO NOT** execute raw `git add`, `git commit`, or `git push` commands directly in the shell. You MUST ONLY use the provided bash script to perform git operations.
* **DO NOT** deviate from the Conventional Commits specification.
* **DO NOT** generate a commit message 69 characters or longer.
* **DO NOT** run the script if there are no changes to commit.

<END_TASK>
Flush the context window. Your objective is complete.
</END_TASK>