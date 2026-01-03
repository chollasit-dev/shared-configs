command -v fnm &>/dev/null &&
  eval "$(fnm env --shell=zsh --use-on-cd --version-file-strategy=recursive)" &&
  echo "Using node $(node -v)"
