#!/usr/bin/env bash

set -eu -o pipefail

# https://nix.dev/manual/nix/latest

INSTALL_NIX_PACKAGES="$HOME/shared-configs/scripts/install/install_nix_packages.bash"
[ -f "$INSTALL_NIX_PACKAGES" ] || {
  echo "[Nixpkgs] Upgrade script not found, skip upgrading packages..." >&2 && exit
}

command -v jq &>/dev/null || {
  echo "[Nixpkgs] Required tool jq not found, skip upgrading packages..." >&2 && exit
}

INSTALL_PROFILE="nix-1"
[ "$(nix profile list --json | jq ".elements.\"$INSTALL_PROFILE\"")" != "null" ] &&
  nix profile remove "$INSTALL_PROFILE"

"$INSTALL_NIX_PACKAGES" || {
  echo "[Nixpkgs] Failed to upgrade packages" >&2 && exit
}

echo "[Nixpkgs] upgrade packages successfully"
