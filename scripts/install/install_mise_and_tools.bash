#!/usr/bin/env bash

set -eu -o pipefail

# https://github.com/jdx/mise

curl https://mise.run | sh || {
  echo "[Mise] Failed to install Mise" >&2 && exit
}

MISE_EXEC="$HOME/.local/bin/mise"
MISE_GLOBAL_CONFIG="$HOME/.config/mise/config.toml"

[ -f "$MISE_GLOBAL_CONFIG" ] || {
  echo "[Mise] Global config not found, skip installing tools..." >&2 && exit
}

[ -f "$MISE_EXEC" ] || {
  echo "[Mise] Mise not found, skip installing tools..." >&2 && exit
}

eval "$("$MISE_EXEC" trust --all --cd "$HOME")" || {
  echo "[Mise] Failed to trust $HOME directory, skip installing tools..." >&2 &&
    exit
}
eval "$("$MISE_EXEC" install --cd "$HOME" --force)" || {
  echo "[Mise] Failed to install tools, please recheck manually as some may not get installed" >&2 &&
    exit
}

echo "[Mise] Install tools successfully"
