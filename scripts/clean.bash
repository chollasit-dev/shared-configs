#!/usr/bin/env bash

set -eu -o pipefail
# nullglob: prevent no-match glob from expanding to literal `*`
# dotglob: expand hidden too
shopt -s dotglob nullglob

log() {
  local scope=${1-clean} msg=${2-}
  printf "[%s] %s\n" "$scope" "$msg"
}

error() {
  local scope=${1-} msg=${2-}
  printf "[clean%s] %s\n" "${scope:+.$scope}" "$msg" >&2
}

try() {
  local scope=$1 msg=$2 err
  shift 2
  if err="$("$@" 2>&1 >/dev/null)"; then
    log "$scope" "$msg"
  else
    error "$scope" "${err:-$msg}"
  fi
}

try trash "Clear trash can (recycle bin)" \
  rm -rf "${HOME:?}/.local/share/Trash/"*

try opencode "Remove OpenCode artifacts" \
  rm -rf "${HOME:?}"/.local/share/opencode/{log,prompt-history.jsonl,snapshot,storage}

try claude "Remove Claude Code artifacts" \
  rm -rf "${HOME:?}"/.claude/{backups,telemetry,paste-cache}*
try claude "Remove Claude Code artifacts" \
  rm -rf "${HOME:?}"/.claude/history.jsonl

try codex "Remove Codex artifacts" rm -rf "${HOME:?}"/.codex/history.jsonl
