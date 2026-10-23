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
# Git Commit Guideline

Commit $scope, in based on $format style

## Convention

- Split the changes into multiple commit if needed
- Always add a blank line between commit title and body
- Prefer bullet points for multi-line commit description body over long
  paragraphs
- Write what is done, not what was decided against
- Do not add co-authored message unless being asked to
