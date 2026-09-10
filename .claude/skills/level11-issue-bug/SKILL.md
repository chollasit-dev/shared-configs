---
name: level11-issue-bug
description: >-
  Skeletal template for writing a concise bug issue body. Use when the user asks
  to write, draft, or open a bug report / bug issue.
argument-hint: summary of the bug
---
# Instructions

Write the bug issue body for: $ARGUMENTS

Fill the template below. Do not add sections it doesn't list.

```md
### Description

<1-2 sentences: what's broken, in what page/module>

### Steps to Reproduce

1. Go to <sidebar section > page>
2. <press/select/type what, on which button/field, with what value>
3. ...

### Expected vs Actual

- Expected: ...
- Actual: ...

### Evidence

<screenshot, log excerpt, or link — only if it adds signal beyond the text
above>
```

## Conventions

- One sentence per field where possible. If a field needs more than 3 sentences,
  the bug isn't scoped tightly enough yet — split it or cut it.
- Steps must be concretely actionable: name the exact page (as reached from the
  sidebar), the exact button/menu/field pressed, and the value entered or
  selected — "download a monthly report" is too vague, "press Download PDF on
  the row" is right. A reader should be able to replay them without asking
  which screen or control was meant.
- Skip `Evidence` entirely rather than leave a placeholder or an empty
  screenshot slot.
- Never restate the issue title inside the body.
- No emoji headers, no decorative dividers (`---`), no bolding every noun.
- Merge `Expected` and `Actual` into single lines each — not paragraphs.
- If root cause is already known, add it as a single `### Cause` line before
  `Evidence` — do not turn it into an investigation writeup.
