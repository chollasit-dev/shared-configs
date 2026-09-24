---
name: level11-checklist
description: >-
  Level11 checklist for the codebase. Use to check an implementation before
  commit or finishing each task
---
# Level11 Checklist

## Permission

- UI: button, etc.
- Endpoints gate (middleware): new routes
- Service function gate: non-readonly, action-based
- Resources: `authz.AccessiblePortfolios`, `CachedChecker`, etc.

## Database Query

- No unnecessary multiple SQL queries for connected go Ent node. If not, try
  manual SQL query + scan first
