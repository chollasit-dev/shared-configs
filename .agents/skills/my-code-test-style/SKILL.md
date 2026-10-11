---
name: my-code-test-style
description: Prefer test style. Use when writing tests in any codebase.
---
# My Test Style

## Test

- List every test and subtest you plan to write, then wait until user approves
  before writing them
- Add assertion message or label instead of comment description
- Move to their own helper function instead of code comment step
- Use existing service functions before reach out to ORM client directly, e.g.,
  `UserAll()[0]` instead of `client.Query.Users().First()`
