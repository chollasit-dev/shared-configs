#!/usr/bin/env bash

set -eu -o pipefail

# Bat
if command -v bat &>/dev/null; then
  read -p "Should update Bat Catppuccin themes? [y/n] " -r update_bat_theme_opts
  case $update_bat_theme_opts in
  "y" | "Y")
    "$HOME/shared-configs/scripts/update/update_bat_theme.bash"
    bat cache --build
    ;;
  esac
fi

# Go
if command -v go &>/dev/null; then
  read -p "Should clean Go cache? [y/n] " -r update_go_opts
  case $update_go_opts in
  "y" | "Y")
    go clean -cache -modcache
    ;;
  esac
fi

# Mise
command -v mise &>/dev/null && mise upgrade --bump && mise prune

# Nix
UPDATE_NIX_SCRIPTS="$HOME/shared-configs/scripts/update/update_nix.bash"
[ -f "$UPDATE_NIX_SCRIPTS" ] && "$UPDATE_NIX_SCRIPTS" &&
  cd "$HOME/nix/" &&
  nix profile remove nix-1 || :

nix profile add &&
  nix profile wipe-history &&
  nix store gc &&
  nix store optimise

# npm registry packages
command -v yarn &>/dev/null && yarn cache clean --all
command -v pnpm &>/dev/null && pnpm cache delete
pnpm up -i
pnpm up -iL
pnpm up -gL
pnpm approve-builds
pnpm approve-builds -g
rm pnpm-lock.yaml yarn.lock package-lock.json pnpm-workspace.yaml &>/dev/null || true

# Yazi
UPDATE_YAZI_THEME="$HOME/shared-configs/scripts/update/update_yazi_theme.zsh"
[ -f "$UPDATE_YAZI_THEME" ] && "$UPDATE_YAZI_THEME"
