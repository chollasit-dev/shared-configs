#!/usr/bin/env bash

set -eu -o pipefail

rm "$HOME/.zsh_history" &>/dev/null
echo "[clean.bash] Remove shell command history"

rm -rf "$HOME/.local/share/Trash/*" &>/dev/null
echo "[clean.bash] Clear Trash bin"

rm -rf "$HOME/.local/share/opencode/{log,snapshot,storage}"
read -p "Should remove prompt history? [y/n] " -r rm_history_opts
case "$rm_history_opts" in
"y" | "Y")
  rm "$HOME/.local/state/opencode/prompt-history.jsonl"
  echo "[clean.bash] Failed to remove OpenCode prompt history" >&2
  ;;
esac
