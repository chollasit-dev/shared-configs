---
name: comment-style
description: Code comment style conventions. Use when handling code comment
---
# Comment Conventions

Apply when writing comments additional to up-to-date best practices. Override
when these conflict with defaults from best practices.

Only write one when the _why_ is non-obvious: a hidden constraint, a subtle
invariant, a workaround, or behavior that surprise a reader. If removing the
comment wouldn't confuse anyone, omit it.

Never explain _what_ the code does unless it is not a well-named identifier and
is impossible to rename

## JS/TS Conventions

Use JSDoc for:

- Exported functions, classes, and types that form a public API of a module.
- Anything consumers might hover in their editor for IntelliSense.
- Non-trivial parameters or return values where the type alone isn't enough to
  convey meaning (units, ranges, ownership, side effects).

Skip JSDoc for:

- Internal helpers, local variables, and obvious one-liners.
- Anything whose TypeScript type already tells the full story — don't restate

### JSDoc format

- Use JSDoc directive if the summary has detail that justify JSDoc directive
  (`@param`, `@returns`, `@throws`, `@example`, etc.) and the signature itself
  isn't enough
- Otherwise, one short summary line is usually enough.

Example 1

```ts
/**
 *
 * <long_description_with_more_than_1_line>
 *
 * @param input - an ISO-8601 duration
 * @returns parsed value in milliseconds
 */
export function parseDuration(input: string): number { ... }
```

Example 2 (If the description is tight and can fits in a single line)

```ts
/** Parses an ISO-8601 duration string into milliseconds. */
export function parseDuration(input: string): number { ... }
```

