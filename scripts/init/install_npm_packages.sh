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
  mongosh
  ngrok
  vercel
)

if ! command -v pnpm &>/dev/null; then
  if ! command -v corepack &>/dev/null; then
    echo "corepack not found, install corepack first" && exit 1
  fi
  corepack install -g pnpm && corepack enable
fi

# global
pnpm add -g "${PACKAGES[@]}" && pnpm approve-builds -g

# Should be global but located at `$HOME` for usability.
cd && pnpm add -D "${PRETTIER_PLUGINS[@]}" && pnpm approve-builds

unset -v PRETTIER_PLUGINS
