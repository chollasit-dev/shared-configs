---
name: open-issue-public
description: >-
  Use when user ask to open an issue on GitHub, GitLab, etc., on public or
  open-source project
arguments:
  - platform
  - template
argument-hint:
  - 'platform: github, gitlab, etc.'
  - 'template: none (fallback in SKILL.md), exists'
disable-model-invocation: true
---
# Instructions

Open $platform issue following the convention below

## Issue title

The issue title style should matches the existing issues in the repository.
Prompt the user if not exists.

## Issue body

If $template == exists, the issue body pattern should matches the existing
issues

otherwise ($template == none), the issue body should be as the following

```md
### Issue type

<issue_type>

### OS Version/build

<environment_used_to_run>

### App version

<app_build_ver>

### Steps to reproduce

1. Step 1
2. Step 2
3. Step 3
```

