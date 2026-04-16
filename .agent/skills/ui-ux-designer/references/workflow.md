# UI/UX Pro Max Workflow

## Standard Flow

1. Parse request.
- Extract product type, industry, style keywords, and target stack.

2. Generate design system first.
- Command: `python3 scripts/search.py "<query>" --design-system -p "<Project Name>"`
- Purpose: establish pattern, style, colors, typography, effects, anti-patterns.

3. Persist when work is multi-page or iterative.
- Commands:
`python3 scripts/search.py "<query>" --design-system --persist -p "<Project Name>"`
`python3 scripts/search.py "<query>" --design-system --persist -p "<Project Name>" --page "<page-name>"`

4. Run focused lookups as needed.
- Domain lookup: `python3 scripts/search.py "<keyword>" --domain <domain> -n <count>`
- Stack lookup: `python3 scripts/search.py "<keyword>" --stack <stack> -n <count>`

5. Implement and verify.
- Apply recommendations in code.
- Enforce gates in `references/quality-gates.md`.

## Query Construction Hints

- Include product + industry + style terms in first design-system query.
- Use short, specific keywords for domain lookups.
- For stack lookups, focus on implementation concern terms (state, routing, forms, accessibility, performance).
