---
name: my-open-issue
description: >-
  Template for issue. Use when user asks to open an issue on GitHub, GitLab,
  etc.
arguments:
  - platform
  - template
argument-hint:
  - github|gitlab|etc(platform)
  - <filepath>|nil(template)
disable-model-invocation: true
---
# Instructions

Open $platform issue following the convention below

## Issue title

The issue title style should matches the existing issues in the repository.
Prompt the user if not exists.

## Issue body

If $template is a file path, the issue body should follow the template in that
file

otherwise ($template == nil), the issue body should be as the following

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

