#!/usr/bin/env bash

set -eu -o pipefail

# https://github.com/tmux-plugins/tpm

TPM_PATH="$HOME/.tmux/plugins/tpm"

rm -rf "$TPM_PATH"

git clone https://github.com/tmux-plugins/tpm "$TPM_PATH" ||
  {
    echo "[TPM] Failed to clone Tmux plugin manager locally" >&2 && exit
  }

echo "[TPM] Clone successfully"
