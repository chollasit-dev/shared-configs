---
name: my-shell-hist-cleanup
description: >-
  Clean up invalid shell history commands. Use when user asks to remove mistyped
  or malformed commands from ~/.{bash,zsh}_history
---
Remove clearly mistyped or syntactically invalid commands from
`~/.{bash,zsh}_history`

- Preserve ambiguous entries, including commands that may rely on aliases,
  functions, or tools that are currently unavailable
- Do not execute history entries to check whether they work
- preserve its history format and multiline entries
