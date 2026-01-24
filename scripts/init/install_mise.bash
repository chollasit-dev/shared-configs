#!/usr/bin/env bash

set -eu -o pipefail

# https://github.com/jdx/mise
curl https://mise.run | sh ||
  {
    echo "[Mise] Failed to install Mise" && exit 1
  }

MISE_EXEC="$HOME/.local/bin/mise"
MISE_GLOBAL_CONFIG="$HOME/.config/mise/config.toml"

[ -f "$MISE_GLOBAL_CONFIG" ] ||
  {
    echo "[Mise] Global config not found, skip installing tools" && exit 1
  }

[ -f "$MISE_EXEC" ] ||
  {
    echo "[Mise] Mise not found" && exit 1
  }

eval "$("$MISE_EXEC" install --force)" ||
  {
    echo "[Mise] Failed to install tools, please recheck manually as some may not get installed" &&
      exit 1
  }

echo "[Mise] Install tools successfully"
