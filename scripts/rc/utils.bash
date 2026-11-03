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
