---
name: my-code-test-style
description: Prefer test style. Use when writing tests in any codebase.
---
# My Test Style

- List every test and subtest you plan to write and wait until user approves
  before writing
- Don't add tests for every feature by default. Add one only if its value
  outweighs its maintenance cost.
- Add assertion message or label instead of comment description
- Move to their own helper function instead of code comment step

## Integration Test

- Use existing service functions before reach out to ORM client directly, e.g.,
  `UserAll()[0]` instead of `client.Query.Users().First()`
