if ! command -v fnm &>/dev/null; then
  echo "fnm not found, install fnm first" && exit 1
fi

NODE_LATEST_LTS=$(fnm list-remote --lts --latest | grep "^v\w\+.\w\+.\w\+" -io)
GLOBAL_NODE_VERSION_PATH="$HOME/.node-version"

if [ ! -f "$GLOBAL_NODE_VERSION_PATH" ]; then
  echo "$NODE_LATEST_LTS" >"$GLOBAL_NODE_VERSION_PATH"
fi

NODE_GLOBAL_CURRENT_VERSION=$(node -v 2>/dev/null)

if [ "$NODE_GLOBAL_CURRENT_VERSION" != "$NODE_LATEST_LTS" ]; then
  if [ ! "$FNM_DIR" ]; then
    eval "$(fnm env --shell=zsh --use-on-cd --version-file-strategy=recursive)"
  fi
  if ! command -v node &>/dev/null; then
    fnm install --lts && fnm use &&
      node -v >"$GLOBAL_NODE_VERSION_PATH" && echo "Installed node $NODE_LATEST_LTS, please manually create a symlink at $GLOBAL_NODE_VERSION_PATH"
  fi
fi

unset -v NODE_LATEST_LTS GLOBAL_NODE_VERSION_PATH NODE_GLOBAL_CURRENT_VERSION
