#!/usr/bin/env bash

set -eu -o pipefail

# https://nix.dev/manual/nix/latest

FLAKE_PATH_DIR="$HOME/shared-configs/nix"

cd "$FLAKE_PATH_DIR" || {
  echo "[Nixpkgs] Failed to change CWD to $FLAKE_PATH_DIR, skip installing packages..." >&2 &&
    exit
}

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

cd "$HOME"
