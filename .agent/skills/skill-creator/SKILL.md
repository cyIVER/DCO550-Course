---
name: skill-creator
description: Scaffolds a new Google Antigravity skill or modifies an existing one, optimizing its trigger descriptions and validating performance. Use this skill autonomously when the user requests to "create a skill", "update a skill", "optimize a skill description" or run skill evaluations and performance tests. Do not use this skill to create generalized python scripts or non-agentic projects.
---

# Antigravity Skill Creation & Optimization Orchestrator

## 1. Definitive Goal Statement
Your objective is to generate, refine, and optimize modular `SKILL.md` directories that strictly adhere to the Google Antigravity progressive disclosure architecture, deterministic execution logic, and rigorous guardrails.

## 2. Trigger Conditions and Operational Context
You must invoke this logical sequence and follow these instructions specifically when:
- Creating a new agentic skill directory from scratch.
- Refactoring an existing monolithic or legacy skill to meet Antigravity structural standards.
- A user wants to generate quantitative evaluations for an existing skill.
- The user requests optimization of a skill's description for the semantic router.

## 3. Resource Discovery and Grounding
Before analyzing the workspace or writing any codebase modifications, you must read and internalize the provided architectural guidelines to ground your output.

<available_resources>

references/Building Google Antigravity Skills.md
The definitive manifesto for Antigravity skill architecture. Read this immediately to ensure your generated skills use progressive disclosure, valid YAML frontmatter, deterministic checklists, explicit constraints, and end-task directives.

references/workflows.md
Guidelines for guiding the agent through sequential steps and branching logic.

references/output-patterns.md
Examples of formatting output correctly.

references/schemas.md
JSON structures for `evals.json`, `grading.json`, etc.

agents/grader.md
Instructions for spawning the grader sub-agent.

agents/comparator.md
Instructions for doing blind A/B comparison.

agents/analyzer.md
Instructions for analyzing why one version beat another.

</available_resources>

## 4. Deterministic Execution Logic (Checklist)
You must process the following implementation steps sequentially. Do not proceed to a subsequent step until the current step is fully executed, verified, and its state is recorded.

* [ ] **Step 1: Capture Intent & Research.** Explicitly ask the user: 
  1. What the skill should enable the Antigravity agent to do.
  2. The specific contextual phrasing for when it should trigger.
  3. Desired exact output format.
  Check for available context, use subagents if necessary for parallel research.
* [ ] **Step 2: Scaffolding the Directory.** Scaffold the `name` directory. Inside, create a `SKILL.md` file following the exact 7-part template described in `Building Google Antigravity Skills.md` (YAML Frontmatter, Goal, Triggers, Resources, Logic Checklist, Constraints, End Directive). Create `scripts/`, `references/`, and `assets/` subdirectories as required. Keep the `SKILL.md` body under 500 lines.
* [ ] **Step 3: Define Test Cases.** Ask the user for 2-3 realistic natural language prompts that a developer would use. Save these to `<skill-name>/evals/evals.json`. Each JSON object MUST strictly use the keys `"id"`, `"query"`, and `"should_trigger"` (boolean). Do not write assertions yet.
* [ ] **Step 4: Execute Parallel Evaluations.** Spawn two subagents simultaneously for each test case—one running the new skill path, one without (baseline). Direct output to `<skill-name>-workspace/iteration-1/eval-<ID>/with_skill/outputs/` and `without_skill/outputs/`. Create `eval_metadata.json` for each trial.
* [ ] **Step 5: Draft Assertions & Grade.** While runs are processing, author objectively verifiable quantitative assertions in `evals/evals.json`. Once runs finish, capture `timing.json` (duration/tokens) from standard output notifications. Spawn a grader sub-agent reading `agents/grader.md` to evaluate outcomes into `grading.json`.
* [ ] **Step 6: Benchmark & Review.** Execute `python -m scripts.aggregate_benchmark <workspace>/iteration-N --skill-name <name>`. Then, launch the viewer (`python eval-viewer/generate_review.py <workspace>/iteration-N --skill-name <name> --benchmark <benchmark_file>`). Provide the URL/HTML file to the user for qualitative feedback.
* [ ] **Step 7: Optimize Semantic Trigger (Optional).** Run `python -m scripts.run_loop --eval-set <trigger-eval.json> --skill-path <path> --model gemini-1.5-pro --max-iterations 5` to optimize the frontmatter description. Apply the top-performing description.
* [ ] **Step 8: Final Packaging.** Execute `python -m scripts.package_skill <skill-path>`. Ask the user to accept the `.skill` file.

## 5. Strict Constraints (Negative Guardrails)
You must adhere to the following limitations unconditionally under all circumstances:
- **DO NOT** use monolithic, unorganized text blobs in the generated `SKILL.md`. You must utilize the `[ ]` markdown checkbox pattern for deterministic logic.
- **DO NOT** use previous generation terminology (e.g. Claude, Claude Code, Anthropic). Always refer to Google Antigravity, Gemini 3 Pro/Flash, and the `gemini` CLI.
- **DO NOT** write arbitrary Python test suites instead of utilizing the formal evaluation directory structure and subagents.
- **DO NOT** run evaluations sequentially if parallel subagents are available.
- **DO NOT** skip the visual evaluation generation (`eval-viewer`) before manually checking the outputs.

## 6. Few-Shot Optimization Examples

### Example 1: Synthesizing a Concise Trigger Description
**Input Context:** A skill designed to lint CSS files and enforce Tailwind conventions.
**Expected Output Implementation:**
```yaml
---
name: tailwind-css-linter
description: Enforces Tailwind CSS styling conventions and lints cascading style sheets. Use this skill autonomously when the user requests UI refactoring, CSS debugging, or explicitly mentions styling, Tailwind, or layout adjustments. Do not use for frontend frameworks entirely disconnected from Tailwind (e.g. raw Bootstrap).
---
```

### Example 2: Progressive Disclosure Resource Linking
**Input Context:** Defining resources for an API documentation skill.
**Expected Output Implementation:**
```xml
<available_resources>
references/api_routes.json
Contains all available internal endpoints, headers, and expected return codes. Read this to validate URI construction.
</available_resources>
```

## 7. End Task Directive
Once the skill is fully generated, tested, and optimized to the user's satisfaction, output the exact phrase: "Task Complete. Awaiting next directive." This signals execution termination and context flushing limit token bloat.
