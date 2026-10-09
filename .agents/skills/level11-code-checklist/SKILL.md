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

- [ ] Tests added or updated for the changed behaviour
- [ ] Schema changes: `migrations/` and `table.sql` are in sync, version bumped
      per `semver.md`
- [ ] DB writes are wrapped in `activity.WithLog` with a matching
      `activity.Info`
- [ ] New UI strings go through `useT`
- [ ] Go vulnerability test
- [ ] `make lint-new` and `yarn lint-ci` pass (no new lint issues)
- [ ] Screenshots attached for UI changes
