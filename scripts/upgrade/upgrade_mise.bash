#!/usr/bin/env bash

set -eu -o pipefail

# https://github.com/jdx/mise

command -v mise &>/dev/null || {
  echo "[Mise] Mise not found, try installing..."
  INSTALL_MISE_AND_TOOLS="$HOME/shared-configs/scripts/install/install_mise_and_tools.bash"
  [ -f "$INSTALL_MISE_AND_TOOLS" ] || {
    echo "[Mise] Failed to install, skip upgrading tools..." >&2 && exit
  }
  "$INSTALL_MISE_AND_TOOLS"
}

mise self-update || {
  echo "[Mise] Failed to upgrade" >&2 && exit
}

echo "[Mise] Upgrade successfully"
