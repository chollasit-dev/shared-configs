#!/usr/bin/env bash

set -eu -o pipefail

# https://nix.dev/manual/nix/latest

FLAKE_PATH_DIR="$HOME/nix"

[ -d "$FLAKE_PATH_DIR" ] || mkdir -p "$FLAKE_PATH_DIR"

[ -f "$FLAKE_PATH_DIR/flake.nix" ] ||
  {
    ln "$HOME/shared-configs/nix/flake.nix" "$FLAKE_PATH_DIR/flake.nix" || {
      echo "[Nixpkgs] Failed to hard-link Nix flake to $HOME, skip installing packages..." >&2 &&
        exit
    }
  }

cd "$FLAKE_PATH_DIR"

command -v nix &>/dev/null || {
  echo "[Nixpkgs] Nix not found, skip installing packages..." >&2 && exit
}

{
  nix profile add &&
    nix store gc &&
    nix store optimise &&
    nix profile wipe-history
} || {
  echo "[Nixpkgs] Failed to install Nix packages" >&2 && exit
}

echo "[Nixpkgs] Install Nix packages successfully"
