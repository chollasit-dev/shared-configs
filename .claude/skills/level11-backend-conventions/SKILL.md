---
name: level11-backend-conventions
description: >-
  Level11 conventions for backend codebase. Use when working with Level11
  backend part
---
# Level11 Backend Conventions

## General code pattern

- `lo.`: inline-prefer situation
- Some handlers use `lo.uniq` before passing data to their service layers
- normal imperative: else `if x == "" { x = y }`

## XLSX export (backend)

- Report module: dedicated `*_excel.go`
- Others: inline inside service function

## Logging

- UI
  - Do not use semicolon use period
  - Format: `<error>. Please <suggestion>`
- Internal
  - Always use lowercase except
    - 3rd-party: service or product (Chrome, OpenTelemetry, etc.)
    - Scope: `Cache: <description>`
