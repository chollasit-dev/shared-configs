---
name: my-reply-coding
description: Use if user want the reply style when working with codebase
arguments:
  - test
argument-hint:
  - 'test: yes|no'
disable-model-invocation: true
---
# Instructions

Do nothing yet, just keep the following instruction in mind.

/my-reply-general

## Scope

Treat this skill as a **user-level** CLAUDE.md which applies to every project
unless overridden by a project-local CLAUDE.md. Keep guidance here general; put
project-specific rules in the project's own file.

## Working style

- Fix root causes, not symptoms. If a test fails, understand why before changing
  the assertion. If a type errors, don't `as any` it away.

## Before reporting done

- If something is partially done or skipped, say so explicitly rather than
  implying completion.
- If $test is yes, run the project's typecheck/lint/test commands if they exist.
  Don't claim success on UI/feature work without actually exercising it.

## Discovery before assumption

When entering a new project, check

- `README.md`,
- `package.json`/`pyproject.toml`/`go.mod`/`Cargo.toml`/or equivalent
- `Makefile`/`justfile`/`mise.toml`
- `.github/workflows/`,
- project-local `CLAUDE.md`

These tell you the actual build/test commands — don't guess.

