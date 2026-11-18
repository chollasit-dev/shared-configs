#!/usr/bin/env bash

notify-done() {
  command -v notify-send >/dev/null ||
    {
      echo "notify-send not found" >&2
      return 127
    }

  "$@"
  local exit_code=$? # $status only works in Zsh

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
