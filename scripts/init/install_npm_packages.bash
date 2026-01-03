#!/usr/bin/env bash

set -eu -o pipefail

if ! command -v pnpm &>/dev/null; then
  if ! command -v corepack &>/dev/null; then
    echo "corepack not found, aborting..." && exit 1
  fi
  corepack install -g pnpm@latest && corepack enable
fi

PRETTIER_PLUGINS=(
  prettier-plugin-astro
  prettier-plugin-css-order
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

pnpm add -g "${PACKAGES[@]}" && pnpm approve-builds -g

# Should be global but located at `$HOME` for usability.
cd "$HOME" && pnpm add -D "${PRETTIER_PLUGINS[@]}" && pnpm approve-builds
