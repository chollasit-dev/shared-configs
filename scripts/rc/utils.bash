#!/usr/bin/env bash

# $status only works in Zsh

notify-done() {
  "$@"
  local exit_code=$?

  if [[ $exit_code != 0 ]]; then
    local body="$*\nCommand failed"
  else
    local body="$*\nCommand success"
  fi
  local summary="Long-running Command: ${PWD##*/}"

  notify-send --urgency=critical "$summary" "$body"
  return "$exit_code"
}

abort() {
  printf "%s\n" "$*" >&2
  return 1
}

fail() {
  abort "$@"
}

wm() {
  tmux has 2>/dev/null || {
    tmux new -d || return 1
  }
  local dir
  dir=$(fd -g '.workmux.yaml' "$HOME" --hidden --no-ignore --exec dirname | fzf)
  if [[ -n $dir ]]; then
    cd "$dir" || return 1
  else
    abort "wm: no workspace selected"
  fi
}

wmo() {
  local cwd=$PWD branch
  wm || return $?

  branch=$(git branch --show-current 2>/dev/null)
  [[ -n $branch ]] || {
    cd "$cwd" || :
    abort "wmo: could not determine current Git branch. Is workspace a Git repository and a branch is switched to?" ||
      return 1
  }
  workmux open "$branch" 2>/dev/null || {
    tmux attach || return 1
  }
}

group-args() {
  local item
  for item in "$@"; do
    if [[ $item == -* ]]; then
      local flags="$flags $item"
    else
      local args="$args $item"
    fi
  done
  printf '%s\n' "$flags" "$args"
}

notify-ai() {
  local type=${1-} harness=${2:-unknown} sess=${3:-unnamed}
  local question=${4-} reply=${5-} body

  case "$type" in
  input)
    (($# == 5)) || {
      fail "notify-ai: expects 5 arguments (received $#)" || return 1
    }
    body="$sess: $question\nUser: $reply"
    ;;
  done)
    body="Q: $question\nA: $reply"
    ;;
  *)
    fail 'Usage: notify-ai {input|done} harness session question reply' || return 2
    ;;
  esac

  notify-send \
    --hint=string:synchronous:"$PWD"-"$harness"-"$sess"-"$type" \
    "${PWD##*/}" \
    "$body"
}
