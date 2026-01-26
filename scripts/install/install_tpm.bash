#!/usr/bin/env bash

set -eu -o pipefail

# https://github.com/tmux-plugins/tpm
TPM_PATH="$HOME/.tmux/plugins/tpm"

rm -rf "$TPM_PATH"

git clone https://github.com/tmux-plugins/tpm "$TPM_PATH" ||
  {
    echo "[TPM] Failed to install Tmux plugin manager" >&2 && exit 1
  }

echo "[TPM] Clone successfully" >&2 && exit 1
