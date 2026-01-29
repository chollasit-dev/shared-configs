#!/usr/bin/env bash

set -eu -o pipefail

# https://github.com/jdx/mise

command -v mise &>/dev/null || {
  echo "[Mise Tools] Mise not found, try installing..."
  INSTALL_MISE_AND_TOOLS="$HOME/shared-configs/scripts/install/install_mise_and_tools.bash"
  [ -f "$INSTALL_MISE_AND_TOOLS" ] || {
    echo "[Mise Tools] Failed to install Mise, skip upgrading tools..." >&2 && exit
  }
  "$INSTALL_MISE_AND_TOOLS"
}

diff <(mise list --cd "$HOME" --global) <(mise list --cd "$HOME" --global --installed) ||
  {
    echo "[Mise Tools] Some tools are not installed yet, installing..."
    mise install --cd "$HOME" || {
      echo "[Mise Tools] Failed to install Mise tools, skip to upgrade existing instead..." >&2
    }
  }

mise upgrade --bump || {
  echo "[Mise Tools] Failed to upgrade Mise tools" >&2 && exit
}

mise prune

echo "[Mise Tools] Upgrade Mise tools successfully"
