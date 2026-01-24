command -v mise &>/dev/null &&
  eval "$(mise activate zsh)" &&
  eval "$(mise trust --all)"

if command -v usage &>/dev/null; then
  eval "$(mise completion zsh)" ||
    print "${fg[blue]}[Mise] ${fg[red]}Failed to add shell completion${reset_color}"
  print "${fg[blue]}[Mise] ${fg[green]}add shell completion successfully${reset_color}"
else
  print "${fg[blue]}[Mise] ${fg[red]}usage-cli not found, shell completion initialization will be skip${reset_color}"
fi
