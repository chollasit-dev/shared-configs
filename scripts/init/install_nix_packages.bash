#!/usr/bin/env bash

set -eu -o pipefail

FLAKE_PATH_DIR="$HOME/nix"
[ -d "$FLAKE_PATH_DIR" ] || mkdir -p "$FLAKE_PATH_DIR"
[ -f "$FLAKE_PATH_DIR/flake.nix" ] || ln "$HOME/shared-configs/nix/flake.nix" "$FLAKE_PATH_DIR/flake.nix"
cd "$FLAKE_PATH_DIR"

command -v nix &>/dev/null ||
  {
    echo "[Nixpkgs] Nix not found" && exit 1
  }

nix profile add &&
  nix store gc &&
  nix store optimise
