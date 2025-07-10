if command -v yazi ya &>/dev/null; then
  echo "yazi not found, install fnm first" && exit 1
fi

ya pkg upgrade
