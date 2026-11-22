---
name: my-shell-hist-cleanup
description: >-
  Clean up invalid shell history commands. Use when user asks to remove mistyped
  or malformed commands from ~/.{bash,zsh}_history
---
Remove clearly mistyped or syntactically invalid commands from
`~/.{bash,zsh}_history`

- Preserve ambiguous entries, including commands that may rely on aliases,
  functions, or tools that are currently unavailable
- Do not execute history entries to check whether they work
- preserve its history format and multiline entries

## Structural

1. Entry-start test — only delete lines matching `^: <epoch>:<duration>;`.
   Continuation lines (no header) are never deletion targets; a corrupted
   multiline entry is judged as a whole.
2. Encoding test — invalid UTF-8 / mojibake inside a token ⇒ typo
   (`[ -ใ<0xA9> .editorconfig ]`). Valid bytes, even odd, are not.
3. Format-artifact exemption — trailing spaces, trailing `\`, blank continuation
   lines are never grounds for removal.

## Command resolution

1. Existence check — `command -v` (not execution) for suspected typos: absent +
   no alias/function ⇒ remove (`lexx`); present ⇒ keep (`grap2graph`,
   `notepad`).
2. Alias/function check — grep configs for definitions (`wmo` is a function ⇒
   keep).
3. Frequency heuristic — a token typed dozens/hundreds of times (`c`, `t`) is
   intentional even if unresolvable; single occurrence of an unresolvable token
   is a typo candidate.
4. Adjacent-correction heuristic — if the next entry is a near-identical
   correction (`lexx`→`less`, `Marshall`→`Marshal`, `--format`→`--format=json`),
   the earlier one is a typo.
5. Scope limit: command name, not arguments — argument-level typos
   (`toml.Marshall`) are kept; only the invoked command/flag being nonexistent
   qualifies.
6. Subcommand grammar — utility-specific prefix/ambiguity rules: tmux allows
   unique prefixes (`a`, `has`, `kill-sess` valid; `kill` ambiguous ⇒ invalid).
   Same test flagged `wpctl list`.
7. Arity check — `test`/`[` 2-arg forms, `rg` without pattern ⇒ malformed.
   Missing-argument commands (`nix profile add`) are incomplete, not malformed ⇒
   kept.

## Context

1. Config-state check — bare directory entry is valid only with
    `setopt autocd`; grep showed it's unset ⇒ invalid. Directory existence alone
    does not condemn `cd` entries.
2. Path existence check — `[ -d ]` on paths in execution position (`./site`,
    `../shared-configs`); nonexistent paths in `cd` position are kept (history,
    not syntax).
3. Deliberate-probing exemption — runs of near-identical exploratory entries
    (`rg --help | rg -g` variants, `[ -f/-p/-h/-L/-S ]`) are experimentation,
    not mistakes.
4. Danger exemption — destructive-but-valid entries (`fd ... --exec-batch rm`,
    `yay -Rns`, `shutdown now`) are never removed; hiding them is worse than
    noise.
5. Duplication is not a criterion — repeated `c`/`ssh`/`git pull` kept; only
    bulk re-stamping by a tool counts as corruption.

## Syntax vs runtime

1. Narrow reading of "invalid" — parse/arity/command-resolution failures only.
    Runtime-failing but well-formed commands (`git reset HEAD~01`,
    `git branch --contains <sha>`, `yay -Rns`, `pass ... -c`) kept.

## Process/verification

1. Delete by exact content, not line number — after the file grew mid-edit,
    line numbers were unsafe; matched full entry strings instead.
2. Diff invariant — post-edit diff must show exactly N deletions, zero
    insertions, and no reordering.
3. Metadata invariant — mode `600`, LF endings, inode-preserving write
    (`cat > file`), line-count arithmetic (`before − N = after`).
4. Corruption detection — bulk identical timestamps (460/463 entries) and
    emptied originals treated as file-level damage, reported instead of silently
    pruned.

Highest false-positive risk in that set: #6 (frequency), #7 (adjacent
correction), and #16's boundary — all judgment calls, not mechanical checks.
