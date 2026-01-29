#!/usr/bin/env bash

set -eu -o pipefail

ya pkg add yazi-rs/flavors:catppuccin-mocha 2>/dev/null ||
  echo "[Yazi] Failed to install theme" >&2
