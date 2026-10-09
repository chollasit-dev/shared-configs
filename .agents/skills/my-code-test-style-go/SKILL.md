---
name: my-code-test-style-go
description: Prefer Go test style. Use when writing tests in Go codebase.
---
# My Go Test Style

## Common

- No semicolon

## Label

### Test Name

`<path>: <condition>`

- Path must be 1 word
- Condition must use easy and straightforward word while still concise
- Condition should tell almost if not all so the reader should understand at the
  first glance, e.g., "value ≠ units × per unit" rather than "inconsistent base"
  (If not sure, just ask me using AskUserQuestion)
- Condition must tell what it is exactly, no comma with non-expected "not ..."
  like this rule itself

Example

- qualified: no fee row
- qualified: fee equals gain
- not qualified: positive fee row

### Assertion Message

The message should be gramatically correct while following rules below

- Do not include article: a, an, the, etc.
- Keep it concise while still human readable
- Do not compare or refer to other variants, e.g., `...; <refers_to_variants>`

Example

- Do: EOD always write on Dec 31
- Don't: EOD writes a Dec 31 row even without flows; the generic flow would not
