#!/usr/bin/env bash

if ! command -v yazi ya &>/dev/null; then
  echo "yazi not found, install yazi first" && exit 1
fi

ya pkg add yazi-rs/flavors:catppuccin-mocha
