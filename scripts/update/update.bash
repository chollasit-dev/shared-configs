#!/usr/bin/env bash

set -eu -o pipefail

if command -v go &>/dev/null; then
  read -p "Should clean Go cache? [y/n] " -r option
  case $option in
  "y" | "Y")
    go clean -cache -modcache
    ;;
  esac
fi

UPDATE_NODE_SCRIPTS="$HOME/shared-configs/scripts/update/update_fnm.zsh"
[ -f "$UPDATE_NODE_SCRIPTS" ] && "$UPDATE_NODE_SCRIPTS"

command -v yarn &>/dev/null && yarn cache clean --all
command -v pnpm &>/dev/null && pnpm cache delete
corepack cache clean && corepack install -g pnpm@latest && corepack enable

pnpm up -i && pnpm up -iL
rm pnpm-lock.yaml yarn.lock package-lock.json pnpm-workspace.yaml &>/dev/null
pnpm up -gL
pnpm approve-builds
pnpm approve-builds -g

UPDATE_YAZI_THEME="$HOME/shared-configs/scripts/update/update_yazi_theme.zsh"
[ -f "$UPDATE_YAZI_THEME" ] && "$UPDATE_YAZI_THEME"
