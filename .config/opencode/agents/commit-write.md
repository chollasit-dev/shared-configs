---
description: Brainstorm commit message for staged changes
mode: subagent
model: opencode/glm-4.7-free
temperature: 0.2
---
Come up with the commit message for the current staged changes. Then, write to
my clipboard, e.g., `echo "Commit message" | wl-copy`.

Following the correct, latest, best practices for conventional commit message.

When referencing previous commits, you may ignore some previous commit that may
not following the best practices, e.g.,

- Types that are not following the conventional styles.
- Scopes: that are neither narrow down to the business logic (like
  frontend/backend) nor common among conventional styles like ui, api, deps, ci,
  etc.

