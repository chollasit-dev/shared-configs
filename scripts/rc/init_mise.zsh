command -v mise &>/dev/null &&
  eval "$(mise activate zsh)" &&
  eval "$(mise trust --all)"

{
  if ! command -v usage &>/dev/null; then
    print "${fg[blue]}[Mise] ${fg[red]}usage-cli not found, skip adding shell completion${reset_color}"
  else
    eval "$(mise completion zsh)" &&
      print "${fg[blue]}[Mise] ${fg[green]}add shell completion successfully${reset_color}"
  fi
} || print "${fg[blue]}[Mise] ${fg[red]}Failed to add shell completion${reset_color}"
