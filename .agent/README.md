# Google Antigravity Agent Template

Welcome to the `.agent_template` boilerplate. This repository structure is designed to be the foundational starting point for constructing deterministic, agentic workflows using Google Antigravity.

## Directory Structure

- **`agents/`**: Store your Persona definitions (`.md` files) here to give your agent specific constraints and specialized roles (e.g., Security Auditor, Frontend Specialist).
- **`rules/`**: Store global and workspace rules here to enforce coding standards, syntax preferences, and operational guardrails.
- **`workflows/`**: Store multi-step sequences here to provide step-by-step instructions for slash commands.
- **`skills/`**: Store autonomous capability packages (Skills) here. A skill connects your agent directly to scripts, references, and executable operations.

## How to Use This Template

1. **Rename this folder**: Start your project by renaming `.agent_template` to `.agent` in the root of your workspace.
2. **Populate Skills**: Drop any functional skills you possess directly into `.agent/skills/`.
3. **Run the `agent-maker` Skill**: If you have the `agent-maker` skill available, run it to autonomously read your loaded skills and generate the accompanying Personas, Rules, and Workflows optimized for those skills!

> [!TIP]
> The `agent-maker` skill will run benchmark evaluations, parallel A/B testing on semantic triggers, and package the ultimate `.agent` configurations for deterministic success.

---
🚀 *Empower your vibe coding with structure.*
