#!/usr/bin/env bash

PRETTIER_PLUGINS=(
  prettier-plugin-css-order
  prettier-plugin-go-template
  prettier-plugin-jsdoc
  prettier-plugin-organize-attributes
  prettier-plugin-organize-imports
  prettier-plugin-packagejson
  prettier-plugin-tailwindcss
)

PACKAGES=(
  @google/gemini-cli
)

if command -v pnpm &>/dev/null; then
  # global
  pnpm add -g "${PACKAGES[@]}"

  # Should be global but located at `$HOME` for usability.
  cd && pnpm add -D "${PRETTIER_PLUGINS[@]}"
fi

unset -v PRETTIER_PLUGINS
