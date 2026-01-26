#!/usr/bin/env bash

set -eu -o pipefail

if command -v bat &>/dev/null; then
  read -p "Should update Bat Catppuccin themes? [y/n] " -r update_bat_theme_opts
  case $update_bat_theme_opts in
  "y" | "Y")
    "$HOME/shared-configs/scripts/update/update_bat_theme.bash"
    bat cache --build
    ;;
  esac
fi

if command -v go &>/dev/null; then
  read -p "Should clean Go cache? [y/n] " -r update_go_opts
  case $update_go_opts in
  "y" | "Y")
    go clean -cache -modcache
    ;;
  esac
fi

UPDATE_NIX_SCRIPTS="$HOME/shared-configs/scripts/update/update_nix.bash"
[ -f "$UPDATE_NIX_SCRIPTS" ] && "$UPDATE_NIX_SCRIPTS"

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
