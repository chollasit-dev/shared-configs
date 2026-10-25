#!/usr/bin/env bash

set -eu -o pipefail

# https://nix.dev/manual/nix/latest

FLAKE_PATH_DIR="$HOME/shared-configs/nix"
PROFILE="nix-1"

cd "$FLAKE_PATH_DIR" || {
  echo "[Nixpkgs] Failed to change CWD to $FLAKE_PATH_DIR, skip installing packages..." >&2 &&
    exit
}

rm "$FLAKE_PATH_DIR/flake.lock" &>/dev/null

if nix profile list --json | jq -e ".elements | has(\"$PROFILE\")" >/dev/null; then
  {
    nix flake update &&
      nix profile upgrade "$PROFILE" &&
      nix store gc &&
      nix store optimise &&
      nix profile wipe-history
  } || {
    echo "[Nixpkgs] Failed to upgrade Nix packages" >&2 && exit
  }
else
  {
    nix profile add &&
      nix store gc &&
      nix store optimise &&
      nix profile wipe-history
  } || {
    echo "[Nixpkgs] Failed to upgrade Nix packages" >&2 && exit
  }
fi

echo "[Nixpkgs] upgrade packages successfully"

cd "$HOME"
