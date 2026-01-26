#!/usr/bin/env bash

set -eu -o pipefail

# https://github.com/catppuccin/bat

THEME_DIR="$HOME/shared-configs/.config/bat/themes"

[ ! -f "$THEME_DIR/Catppuccin Latte.tmTheme" ] &&
  wget -P "$THEME_DIR" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
[ ! -f "$THEME_DIR/Catppuccin Frappe.tmTheme" ] &&
  wget -P "$THEME_DIR" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
[ ! -f "$THEME_DIR/Catppuccin Macchiato.tmTheme" ] &&
  wget -P "$THEME_DIR" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
[ ! -f "$THEME_DIR/Catppuccin Mocha.tmTheme" ] &&
  wget -P "$THEME_DIR" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
