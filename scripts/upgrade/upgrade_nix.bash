#!/usr/bin/env bash

set -eu -o pipefail

# https://nix.dev/manual/nix/latest

EXIT=false
! command -v jq &>/dev/null && echo "[Nix] jq not found" >&2 && EXIT=true
! command -v sed &>/dev/null && echo "[Nix] sed not found" >&2 && EXIT=true
[ "$EXIT" = true ] && echo "[Nix] Missing required tools, skip upgrading..." && exit

RELEASE_VERSION="$(curl -s https://api.github.com/repos/NixOS/nix/tags | jq '.[0].name' | sed 's/\"//g')"
NIX_INSTALLED_VERSION="$(nix --version | sed 's/[^0-9.]//g')"
INSTALLED_VERSION="${NIX_INSTALLED_VERSION:-bar}"

[ "$RELEASE_VERSION" != "$INSTALLED_VERSION" ] || {
  echo "[Nix] Already at the latest release version" && exit
}

sudo rm -rf "/nix" "$HOME/.nix-channels" "$HOME/.nix-defexpr" "$HOME/.nix-profile" || {
  echo "[Nix] Failed to remove symlink to the current older version" >&2 && exit
}

rm -rf "$HOME/.local/.cache/nix" ||
  echo "[Nix] Unable to remove old caches" >&2
rm -rf "$HOME/.local/state/nix/profiles" ||
  echo "[Nix] Unable to clear profile history" >&2

INSTALL_SCRIPT="$HOME/shared-configs/scripts/install/install_nix.bash"

[ -f "$INSTALL_SCRIPT" ] || {
  echo "[Nix] Install script not found, skip upgrading..." >&2 && exit
}

"$INSTALL_SCRIPT" || {
  echo "[Nix] Upgrade to the latest newer version failed" >&2 && exit
}

echo "[Nix] Upgrade from v$INSTALLED_VERSION to v$RELEASE_VERSION successfully"
