---
name: level11-issue-feature
description: >-
  Skeletal template for writing a concise feature/backlog issue body. Use when
  the user asks to write, draft, or open a feature request / backlog issue.
argument-hint: summary of the feature
---
# Instructions

Write the feature issue body for: $ARGUMENTS

Fill the template below. Do not add sections it doesn't list.

```md
### Objective

<1-2 sentences: what's wanted and why>

### Location

<page/module or URL>

### Requested Changes

- ...
- ...

### Reference

<screenshot or mockup — only if it adds signal beyond the text above>
```

## Conventions

- `Objective` states the outcome, not the implementation — leave "how" to
  `Requested Changes`.
- `Requested Changes` is a flat bullet list, not nested sub-sections per screen
  or per settings tab — if it needs sub-sections, it's two issues.
- Skip `Reference` entirely rather than leave a placeholder.
- Never restate the issue title inside the body.
- No emoji headers, no decorative dividers (`---`), no bolding every noun.
- State who asked (client/tenant) as a single trailing line only if it changes
  priority — don't build a "requested for" section around it.

