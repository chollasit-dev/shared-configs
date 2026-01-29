#!/usr/bin/env bash

set -eu -o pipefail

command -v pnpm &>/dev/null || {
  echo "[pnpm] not found, skip upgrading dependencies, plugins, etc." >&2 && exit
}

{
  cd "$HOME" &&
    pnpm up -i && pnpm up -iL &&
    pnpm approve-builds
} || echo "[pnpm] Unable to upgrade npm packages, skip upgrading dependencies, plugins, etc." >&2

rm pnpm-lock.yaml yarn.lock package-lock.json pnpm-workspace.yaml &>/dev/null || :
