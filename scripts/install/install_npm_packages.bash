#!/usr/bin/env bash

set -eu -o pipefail

command -v pnpm &>/dev/null ||
  {
    echo "[pnpm] pnpm not found, skip installing dependencies, plugins, etc." >&2 && exit
  }

# Should be global but located at `$HOME` for usability.
[ -f "$HOME/package.json" ] ||
  {
    echo "[pnpm] package.json not found at $HOME, skip installing dependencies, plugins, etc." >&2 && exit
  }

cd "$HOME"

pnpm i || {
  echo "[pnpm] Failed to install npm packages" >&2 && exit
}

pnpm approve-builds &&
  echo "[pnpm] Install npm packages successfully"

# AI skills.sh
pnpm dlx skills add mattpocock/skills --global --skill grill-me --agent claude-code opencode --yes
pnpm dlx skills add JetBrains/go-modern-guidelines --global --skill use-modern-go --agent claude-code opencode --yes
