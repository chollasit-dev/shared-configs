#!/usr/bin/env bash

set -eu -o pipefail

command -v ya &>/dev/null || {
  echo "[Yazi] Ya package manager not found, make sure Yazi is installed correctly" >&2 &&
    echo "[Yazi] Skip upgrading theme..." >&2 &&
    exit
}

ya pkg upgrade 2>/dev/null || {
  echo "[Yazi] Failed to upgrade theme" >&2 && exit
}
