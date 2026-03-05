# Javascript/Typescript Coding Rules

## Common Rules

These are common rules that should always follow

- Do not export unless is used anywhere else
- Prefer ternary operator over if-else statement unless nested is mandatory
- Order HTML/JSX attributes/props following
  <https://perfectionist.dev/rules/sort-jsx-props.html>, also apply to HTML or
  other JSX-likes even if the docs is specifically for JSX
- Prefer inline destructuring parameter for util/helper functions with a single
  parameter object if suitable unless a `React.FC` type or the argument object
  has a lot of properties
- Prefer dedicated type import `import type { Type } from ...` rather than
  inline-type import `import { type Type, Others } from ...`

## Specific Rules

These are specific rules that should apply if the file are in this working
directory: `/home/chin/projects/jobs/level11/pman/**`

- Prefer arrow function unless a `React.FC` or React component type

These are rules for any working directory apart from mentioned above:

- Always prefer arrow function
- Prefer `readonly` for object type shape when applicable
