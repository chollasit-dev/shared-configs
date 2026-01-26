#!/usr/bin/env bash

set -eu -o pipefail

command -v pnpm &>/dev/null ||
  {
    echo "[pnpm] pnpm not found" && exit 1
  }

# Should be global but located at `$HOME` for usability.

[ -f "$HOME/package.json" ] ||
  {
    echo "[pnpm] package.json not found at $HOME" && exit 1
  }

cd "$HOME" && pnpm i && pnpm approve-builds
