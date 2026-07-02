# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with
code in this repository.

## Scope

This is a **user-level** CLAUDE.md at `~/.claude/CLAUDE.md` — it applies to
every project unless overridden by a project-local `CLAUDE.md`. Keep guidance
here general; put project-specific rules in the project's own file.

## Working style

- Fix root causes, not symptoms. If a test fails, understand why before changing
  the assertion. If a type errors, don't `as any` it away.

## Before reporting done

- Run the project's typecheck/lint/test commands if they exist. Don't claim
  success on UI/feature work without actually exercising it.
- If something is partially done or skipped, say so explicitly rather than
  implying completion.

## Discovery before assumption

When entering a new project, check for: `README.md`,
`package.json`/`pyproject.toml`/`Cargo.toml`/`go.mod` (or equivalent),
`Makefile`/`justfile`, `.github/workflows/`, and any project-local `CLAUDE.md`.
These tell you the actual build/test commands — don't guess.
