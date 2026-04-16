# UI Quality Gates

Apply these before delivering code.

## Accessibility

- Meet at least 4.5:1 contrast for normal text.
- Keep visible keyboard focus on all interactive controls.
- Provide labels for form inputs and alt text for meaningful images.
- Keep touch targets at least 44x44px.
- Respect `prefers-reduced-motion`.

## Interaction

- Add clear hover/focus/active states without layout shift.
- Add `cursor-pointer` only to truly interactive elements.
- Use predictable loading and error feedback for async actions.

## Visual Consistency

- Use one icon family per screen.
- Avoid emoji as UI icons.
- Keep spacing and container widths consistent.
- Ensure transparent or glass surfaces remain legible in light mode.

## Responsive and Layout

- Validate at 375, 768, 1024, 1440 widths.
- Avoid horizontal scrolling on mobile.
- Reserve space for async content to prevent jumps.

## Performance

- Prefer transform/opacity for animations.
- Use lazy-loading and responsive images where relevant.
- Avoid unnecessary rerenders and oversized bundles.
