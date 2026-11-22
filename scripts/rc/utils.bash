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

# Use to log error from command to prepare before main command run
abort() {
  printf "%s\n" "$*" >&2
}

# Use to log error from main command which its purpose function or script name mean this
fail() {
  abort "$@"
}

wm() {
  local dir=
  dir=$(fd -g '.workmux.yaml' "$HOME" --hidden --no-ignore --exec dirname | fzf)
  if [[ -n $dir ]]; then
    cd "$dir" || return 1
  else
    abort "wm: no workspace selected"
    return 130 # Empty selection mean cancelled `CTRL + C`
  fi
}

wmo() {
  local cwd=$PWD branch err_status=0 start_session_id worktree workspace_dir sessions session session_path target=
  wm || return $?

  if ! branch=$(git branch --show-current 2>/dev/null) || [[ -z $branch ]]; then
    cd "$cwd" || :
    abort "wmo: could not find current Git branch. Make sure workspace is Git repository"
    return 1
  fi

  if [[ -n ${TMUX:-} ]]; then
    workmux open "$branch"
    return $?
  fi

  worktree=$(workmux path "$branch") || return $?
  workspace_dir=$(pwd -P) || return $?
  if [[ $workspace_dir != "$worktree/"* ]]; then
    workspace_dir=$worktree
  fi

  if ! tmux has 2>/dev/null; then
    start_session_id=$(tmux new-session -dP -F '#{session_id}') || {
      err_status=$?
      abort "wmo: could not create temporary tmux session"
      return $err_status
    }
  fi

  # --background gives no error when no existing client attach to any session
  workmux open --background "$branch" || err_status=$?
  if [[ -n ${start_session_id:-} ]]; then
    tmux kill-session -t "$start_session_id" || :
  fi
  ((err_status == 0)) || return "$err_status"

  sessions=$(tmux list-sessions -F '#{session_id} #{session_path}') || return $?
  while IFS= read -r session; do
    session_path=${session#* }
    if [[ $session_path != "$worktree" && $session_path != "$workspace_dir" ]]; then
      continue
    fi
    if [[ -n $target ]]; then
      target=
      break
    fi
    target=${session%% *}
  done <<<"$sessions"
  if [[ -z $target ]]; then
    fail "wmo: could not identify unique tmux session for $worktree"
    return 1
  fi

  tmux attach -t "$target" || {
    err_status=$?
    fail "wmo: could not attach to tmux session $target"
    return "$err_status"
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
  local question=${4-} reply=${5-} summary=${PWD##*/} body icon

  if ((${#question} > 200)); then
    question="${question:0:200}..."
  fi

  case "$type" in
  input)
    (($# == 5)) || {
      fail "notify-ai: expects 5 args (received $#)"
      return 1
    }
    icon=dialog-question
    if [[ -n $reply ]]; then
      body="$sess: $question"$'\n'"User: $reply"
    else
      summary="$harness: $summary"
      body=$question
    fi
    ;;
  done)
    icon=dialog-information
    if [[ -n $question || -n $reply ]]; then
      body="Q: $question"$'\n'"A: $reply"
    else
      body=$summary
      summary="$harness: done"
    fi
    ;;
  *)
    fail 'Usage: notify-ai {input|done} harness session question reply'
    return 2
    ;;
  esac

  notify-send \
    --app-name="$harness" \
    --icon="$icon" \
    --hint="string:synchronous:$PWD-$harness-$sess-$type" \
    -- "$summary" \
    "$body"
}

notify-ai-hook() {
  local type=$1 harness=$2 fallback=$3
  local payload sess question

  payload=$(cat) || return 1
  sess=$(jq -r '.session_id // empty' <<<"$payload" 2>/dev/null) || sess=
  if [[ $type == input ]]; then
    question=$(jq -r '.tool_input.questions[0] | .question // .title // empty' <<<"$payload" 2>/dev/null) || question=
  fi

  notify-ai "$type" "$harness" "$sess" "${question:-$fallback}" ''
}
