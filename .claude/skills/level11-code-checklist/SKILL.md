---
name: level11-code-checklist
description: Checklist for Level11 codebase. Use before user asks you to commit.
---
# Level11 Checklist

## Before PR

Recheck the following checklist before each PR, or if stricter, before each
commit

### Permission

- UI: button, etc.
- Endpoints gate (middleware): new routes
- Service function gate: non-readonly, action-based
- Resources: `authz.AccessiblePortfolios`, `CachedChecker`, etc.

### Database Interaction

- No unnecessary multiple SQL queries for connected go Ent node. If not, try
  manual SQL query + scan first

## Reminder

### Code Quality
