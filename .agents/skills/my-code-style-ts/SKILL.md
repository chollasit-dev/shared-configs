---
name: my-code-style-ts
description: Prefer TypeScript code style. Use when working on TypeScript codebase.
---
# My TypeScript Coding Style

Read and follow /my-code-style first

## Rules

- Prefer `readonly` for any immutable fields
- Do not export constants, variables, types, etc. unless used elsewhere
- Prefer interface over type if applicable

## Syntax

### Candidates

Prefer these where applicable

- Set Methods
- Iterator Helpers
- Promise.try
- Import Attributes
- Regular Expression Escape
- Array.fromAsync
- Error.isError
- Map Methods
- Math.sumPrecise
- Explicit Resource Management
- Temporal API
- Brand types: `type InvoiceId = string & { [__brand]: "invoiceId" }`

Note that these above should not introduce unnecessary overhead. Some are
unnecessary if widely-used syntaxes already solved the issue, e.g., JS object is
fine over the map when no unsupported map operations are needed or no
significant performance gain
