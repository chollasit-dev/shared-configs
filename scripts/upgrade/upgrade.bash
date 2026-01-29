#!/usr/bin/env bash

set -eu -o pipefail

#
# Pre-upgrade: Prepare (clean, etc.)
#

# Go
if command -v go &>/dev/null; then
  read -p "Should clean Go cache before upgrading? [y/n] " -r upgrade_go_opts
  case $upgrade_go_opts in
  "y" | "Y")
    go clean -cache -modcache
    ;;
  esac
fi

#
# Upgrade
#

UPGRADE_SCRIPTS_DIR="$HOME/shared-configs/scripts/upgrade"

# Bat
UPGRADE_BAT_THEME="$UPGRADE_SCRIPTS_DIR/upgrade_bat_theme.bash"
[ -f "$UPGRADE_BAT_THEME" ] && "$UPGRADE_BAT_THEME"

# Mise

# NPM package managers are managed with `mise`
# Therefore, should perform cleanup before upgrading
{
  command -v yarn &>/dev/null &&
    yarn cache clean --all
} || echo "[Yarn] not found, skip removing cache"
{
  command -v pnpm &>/dev/null
  pnpm cache delete
} || echo "[pnpm] not found, skip removing cache"

UPGRADE_MISE="$UPGRADE_SCRIPTS_DIR/upgrade_mise.bash"
[ -f "$UPGRADE_MISE" ] && "$UPGRADE_MISE"
UPGRADE_MISE_TOOLS="$UPGRADE_SCRIPTS_DIR/upgrade_mise_tools.bash"
[ -f "$UPGRADE_MISE_TOOLS" ] && "$UPGRADE_MISE_TOOLS"

# Nix
UPGRADE_NIX="$UPGRADE_SCRIPTS_DIR/upgrade_nix.bash"
[ -f "$UPGRADE_NIX" ] && "$UPGRADE_NIX"
UPGRADE_NIX_PACKAGES="$UPGRADE_SCRIPTS_DIR/upgrade_nix_packages.bash"
[ -f "$UPGRADE_NIX_PACKAGES" ] && "$UPGRADE_NIX_PACKAGES"

# NPM packages
UPGRADE_NPM_PACKAGES="$UPGRADE_SCRIPTS_DIR/upgrade_npm_packages.bash"
[ -f "$UPGRADE_NPM_PACKAGES" ] && "$UPGRADE_NPM_PACKAGES"

# Yazi
UPGRADE_YAZI_THEME="$UPGRADE_SCRIPTS_DIR/upgrade_yazi_theme.zsh"
[ -f "$UPGRADE_YAZI_THEME" ] && "$UPGRADE_YAZI_THEME"
