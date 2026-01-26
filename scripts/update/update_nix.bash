#!/usr/bin/env bash

set -eu -o pipefail

# https://nix.dev/manual/nix/latest
RELEASE_VERSION="$(curl -s https://api.github.com/repos/NixOS/nix/tags | jq '.[0].name' | sed 's/\"//g')"
INSTALLED_VERSION="$(nix --version | sed 's/[^0-9.]//g')"

[ "$RELEASE_VERSION" != "$INSTALLED_VERSION" ] ||
  {
    echo "[Nix] Already at the latest release version" && exit
  }

sudo rm -rf "/nix" "$HOME/.nix-channels" "$HOME/.nix-defexpr" "$HOME/.nix-profile" &&
  rm -rf "$HOME/.local/.cache/nix" &&
  rm -rf "$HOME/.local/state/nix/profiles" &&
  "$HOME/shared-configs/scripts/init/install_nix.bash" &&
  echo "[Nix] Upgrade from v$INSTALLED_VERSION to v$RELEASE_VERSION successfully"
