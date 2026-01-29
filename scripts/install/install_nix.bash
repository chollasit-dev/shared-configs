#!/usr/bin/env bash

set -eu -o pipefail

# https://nix.dev/manual/nix/latest

[ -f "$HOME/.config/nix/nix.conf" ] && EXTRA_CONF_FILE="$HOME/.config/nix/nix.conf"

if [ ! -z "$EXTRA_CONF_FILE" ]; then
  curl -L https://nixos.org/nix/install | sh -s -- --no-daemon --yes --no-modify-profile --nix-extra-conf-file "$HOME/.config/nix/nix.conf"
else
  curl -L https://nixos.org/nix/install | sh -s -- --no-daemon --yes --no-modify-profile
fi

[ -f "$HOME/.nix-profile/bin/nix" ] || {
  echo "[Nix] Failed to install Nix" >&2 && exit
}

echo "[Nix] Install Nix successfully"
