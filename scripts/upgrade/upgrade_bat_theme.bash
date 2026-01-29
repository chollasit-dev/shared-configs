#!/usr/bin/env bash

set -eu -o pipefail

# https://github.com/catppuccin/bat

command -v bat &>/dev/null || {
  echo "[Bat] not found, skip upgrading..." >&2 && exit
}

read -p "Should upgrade Bat Catppuccin themes? [y/n] " -r options

THEME_DIR="$HOME/shared-configs/.config/bat/themes"

case $options in
"y" | "Y")
  [ ! -f "$THEME_DIR/Catppuccin Latte.tmTheme" ] &&
    wget -P "$THEME_DIR" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
  [ ! -f "$THEME_DIR/Catppuccin Frappe.tmTheme" ] &&
    wget -P "$THEME_DIR" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
  [ ! -f "$THEME_DIR/Catppuccin Macchiato.tmTheme" ] &&
    wget -P "$THEME_DIR" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
  [ ! -f "$THEME_DIR/Catppuccin Mocha.tmTheme" ] &&
    wget -P "$THEME_DIR" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme

  bat cache --build

  echo "[Bat] Upgrade Bat theme successfully"
  ;;
esac
