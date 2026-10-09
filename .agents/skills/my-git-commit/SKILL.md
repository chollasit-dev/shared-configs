---
name: my-git-commit
description: >-
  Prefer commit message style. Use when user asks to commit changes or draft
  commit message.
arguments:
  - scope
  - format
argument-hint:
  - local|stage|etc(scope)
  - conventional|nil|etc(format)
---
# My Git Commit

Commit $scope, in based on $format style

## Conventions

- Split the changes into multiple commit if needed
- Do no add co-authored message unless being asked to
- Prefer bullet points for multi-line commit description body over long
  paragraphs
- Write what is done, not what is not decide to do
