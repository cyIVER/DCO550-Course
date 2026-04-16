---
name: ui-ux-pro-max
description: UI/UX design system and implementation guidance for websites, landing pages, dashboards, admin panels, SaaS, ecommerce, portfolios, blogs, and mobile apps. Use when asked to plan, design, build, review, or improve UI/UX code, accessibility, layout, typography, colors, animation, components, or stack-specific frontend patterns.
---

# UI/UX Pro Max

Use this skill to generate a design system, retrieve domain guidance from CSV datasets, and apply stack-specific implementation rules.

## Resource Map

- `scripts/`: executable logic
- `scripts/search.py`: entrypoint for domain, stack, and `--design-system` workflows
- `scripts/core.py`: BM25 search over CSV datasets
- `scripts/design_system.py`: multi-domain synthesis + persistence
- `data/`: structured knowledge base (styles, colors, charts, landing patterns, UX, typography, stacks)
- `references/`: concise operating references for this skill
- `assets/templates/`: reusable template content and platform metadata

## Execution Setup

Run from the skill directory when possible:

```bash
cd .agents/skills/ui-ux-pro-max
python3 scripts/search.py "saas dashboard" --design-system
```

If current working directory is unknown, locate the script first:

```bash
SEARCH_SCRIPT="$(find . -path '*/ui-ux-pro-max/scripts/search.py' | head -n 1)"
python3 "$SEARCH_SCRIPT" "saas dashboard" --design-system
```

## Workflow

1. Analyze request.
Identify product type, style intent, domain constraints, and target stack.

2. Generate design system first.

```bash
python3 scripts/search.py "<product + industry + style keywords>" --design-system -p "<Project Name>"
```

3. Persist design system when work spans multiple pages or sessions.

```bash
python3 scripts/search.py "<query>" --design-system --persist -p "<Project Name>"
python3 scripts/search.py "<query>" --design-system --persist -p "<Project Name>" --page "<page-name>"
```

4. Run targeted lookups only as needed.

```bash
python3 scripts/search.py "<keyword>" --domain <domain> -n <count>
python3 scripts/search.py "<keyword>" --stack <stack> -n <count>
```

5. Implement or review UI code using returned recommendations and the quality gates in `references/quality-gates.md`.

## Domain and Stack Coverage

Use `references/domain-stack-map.md` for the current source-of-truth list.

Common domains:
- `style`, `color`, `chart`, `landing`, `product`, `ux`, `typography`, `icons`, `react`, `web`

Common stacks:
- `html-tailwind`, `react`, `nextjs`, `astro`, `vue`, `nuxtjs`, `nuxt-ui`, `svelte`, `swiftui`, `react-native`, `flutter`, `shadcn`, `jetpack-compose`

## Output Modes

- `--design-system` returns synthesized recommendations from multiple datasets.
- `-f ascii|markdown` controls design-system format.
- `--json` is available for domain/stack searches.

## References Usage Rules

- Start with `references/workflow.md` for execution order.
- Use `references/domain-stack-map.md` when selecting domains/stacks.
- Use `references/quality-gates.md` before final output.

Do not inline large tables from `data/` into conversation unless requested.

## Assets Usage Rules

Use assets as reusable templates, not as context bloat:

- Base templates: `assets/templates/base/`
- Platform metadata: `assets/templates/platforms/`

When generating skill/package variants for a specific platform, use the matching JSON in `assets/templates/platforms/` (for Gemini, `gemini.json`) as the default profile.

## Example

User request: `Làm landing page cho dịch vụ chăm sóc da chuyên nghiệp`

Execution:

```bash
python3 scripts/search.py "beauty spa wellness service elegant professional" --design-system -p "Serenity Spa"
python3 scripts/search.py "hero social proof pricing cta" --domain landing
python3 scripts/search.py "animation accessibility touch target" --domain ux
python3 scripts/search.py "responsive typography form sections" --stack html-tailwind
```

Apply the results to produce the landing page structure, visual style, accessibility behavior, and implementation details.
