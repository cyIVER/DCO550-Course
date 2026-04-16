---
name: github-readme-writer
description: "Generates a professional, structured GitHub README.md for a repository by analyzing the codebase, identifying tech stacks, and rendering a Jinja2 standard template. Use this when the user asks to write docs, initialize documentation, or generate a README."
---

# GitHub README.md Writer

## Goal
To autonomously analyze a local repository, accurately detect its architecture and dependencies, and generate an elite, open-source standard `README.md` file using structured Jinja2 templates.

## When to Use This Skill
* When the user requests to "write docs for this repo" or "generate a GitHub README".
* When initializing documentation for a new project.

## Resource Discovery and Grounding
Before generating any documentation, you must ground yourself using the standard template provided below.

<available_resources>
references/readme_template.md.hbs
The organizational standard README template. It specifies exact headers, badge placeholders, usage instructions, and file tree sections.
</available_resources>

## Execution Protocol (Checklist)

You must process the following implementation steps sequentially. Do not proceed to a subsequent step until the current step is fully executed, verified, and its state is recorded.

### [ ] Phase 1: Repository Context Discovery
1. **Analyze Input:** Review the user's prompt. Are there specific highlights (e.g., "focus on the API", "mention the Docker setup")?
2. **Execute Repo Scanner:** Run the provided Python script to deterministically map the repository structure and parse key dependencies (like `package.json` or `pyproject.toml`).
   * Command: `uv run scripts/repo_scanner.py --dir .`
3. **Information Synthesis:** Process the JSON/string output of the `repo_scanner.py` script. Understand the primary language, framework, and architecture pattern.

### [ ] Phase 2: Template Alignment
1. **Load Template:** Read the organizational standard template located at `references/readme_template.md.hbs`.
2. **Identify Missing Context:** Determine if critical fields (like `Usage Examples` or `Installation Commands`) are obvious from the scanned codebase. If they are obscure or non-standard, immediately prompt the user for clarification before proceeding to draft the document.

### [ ] Phase 3: Specification Architecting
Draft the content payload for the README template. Prepare a Python dictionary or JSON payload conceptually containing:
* `project_name`
* `description`
* `tech_stack_badges` (markdown links)
* `installation_commands`
* `usage_examples`
* `file_tree`
* `contributing_guidelines`
* `license_type`

### [ ] Phase 4: Artifact Generation and Rendering
1. Use the create artifact protocol to generate the document structure in the workspace.
2. Name the file: `README.md`.
3. If the user hasn't provided a license, assume standard "MIT" as a placeholder but add a comment for them to review it.
4. Render the gathered data into the `references/readme_template.md.hbs` format, injecting the generated textual strings exactly where the template tags specify.
5. Provide the final formatted `README.md` to the user and request human-in-the-loop review.

## Constraints & Non-Negotiables
* **DO NOT** guess or hallucinate installation commands. Use the actual `scripts` objects from `package.json`, or explicitly state the commands found in build files.
* **DO NOT** alter the file system directly (e.g., creating other configuration files) other than the `README.md` file.
* **DO NOT** deviate from the layout provided by the Jinja2 template. Maintain all primary `H2` (`##`) headers as specified in the template.

<END_TASK>
Flush the context window. Your objective is complete.
</END_TASK>
