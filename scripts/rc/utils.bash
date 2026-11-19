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

wm() {
  tmux has 2>/dev/null || {
    tmux new -d || return 1
  }
  local dir
  dir=$(fd -g '.workmux.yaml' "$HOME" --hidden --no-ignore --exec dirname | fzf || pwd)
  cd "$dir" || return 1
}

wmo() {
  local cwd=$PWD branch
  wm || return $?

  branch=$(git branch --show-current 2>/dev/null)
  [[ -n $branch ]] || {
    echo "No git branch exists, did you forget to run git init?" >&2
    cd "$cwd" || :
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
      echo "Missing args: expected 5; received $#" >&2
      return 1
    }
    body="$sess: $question\nUser: $reply"
    ;;
  done)
    body="Q: $question\nA: $reply"
    ;;
  *)
    printf 'Usage: notify-ai {input|done} harness session question reply\n' >&2
    return 2
    ;;
  esac

  notify-send \
    --hint=string:synchronous:"$PWD"-"$harness"-"$sess"-"$type" \
    "${PWD##*/}" \
    "$body"
}
