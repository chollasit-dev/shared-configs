---
name: my-code-style-ts
description: >-
  Prefer TypeScript code style. Use when working on TypeScript codebase.
---
# My TypeScript Coding Style

## Prerequisite

Before determine which syntax version to use

- For non-project, standalone file, prefer newest syntaxes possible
- For project-based, check if
  - The project targets an environment that supports new syntaxes
  - The project has transpiler to convert new syntaxes down to the target
    environment.
  - If none is specified, use the latest syntaxes

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

Note that these above should not introduce unnecessary overhead. Some are
unnecessary if widely-used syntaxes already solved the issue, e.g., JS object is
fine over the map when no unsupported map operations are needed or no
significant performance gain

