---
name: level11-convention-backend
description: >-
  Conventions for Level11 backend codebase. Use when working with Level11
  backend codebase.
---
# Level11 Backend Conventions

## General code pattern

- Use `lo.` helpers where an inline expression is preferred
- Some handlers use `lo.uniq` before passing data to their service layers
- Otherwise, use plain imperative code, e.g., `if x == "" { x = y }`

## XLSX export (backend)

- Report module: dedicated `*_excel.go`
- Others: inline inside service function

## Logging

- UI
  - Use period, not semicolon
  - Format: `<error>. Please <suggestion>`
- Internal
  - Always use lowercase except
    - 3rd-party: service or product (Chrome, OpenTelemetry, etc.)
    - Scope: `Cache: <description>`
