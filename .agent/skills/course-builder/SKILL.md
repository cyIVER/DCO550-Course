---
name: course-builder
description: Autonomously builds, previews, and validates the Astro course platform. Use this skill when the user requests to "build the site", "start the dev server", or "preview the course". Do not use for general repository maintenance.
---

# Course Platform Builder

## 1. Primary Goal
Your objective is to ensure the DCO 550 Astro website is correctly compiled and ready for deployment or local preview, with no broken components or missing assets.

## 2. Trigger Conditions and Operational Context
You must invoke this logical sequence when:
- New content (slides, Markdown) has been added and needs validation.
- The user wants to see a live preview of the site.
- A production build is required for hosting.

## 3. Resource Discovery and Grounding
<available_resources>
courses/adversary-hunting/package.json
Defines the npm scripts for `dev`, `build`, and `preview`.

courses/adversary-hunting/Dockerfile
The build stage logic for the production site.
</available_resources>

## 4. Deterministic Execution Logic (Checklist)
* [ ] **Step 1: Dependency Check.** Navigate to `courses/adversary-hunting/` and run `npm install`.
* [ ] **Step 2: Build Verification.** Run `npm run build`. Analyze the output for any Astro compilation errors or Tailwind/CSS issues.
* [ ] **Step 3: Preview Generation.** If the build succeeds, run `npm run preview` (if the environment allows) or notify the user that the `dist/` directory is ready.
* [ ] **Step 4: Quality Gate.** Use the `frontend-architect` skills to check the "System Nominal" aesthetic in the build logs.

## 5. Strict Constraints (Negative Guardrails)
- **DO NOT** push to the main branch if the `npm run build` command fails.
- **DO NOT** alter the `outDir` in `astro.config.mjs` without confirming the impact on the Docker deployment.

## 6. Few-Shot Optimization Examples
### Example 1: Building after content update
**Input:** "I just finished the Session 2.1 slides, check the build."
**Action:** Activate `course-builder`, run build, and report success.

## 7. End Task Directive
Once the build is complete and the `dist` folder is populated, output: "Course Build Task Complete. Awaiting next directive."
