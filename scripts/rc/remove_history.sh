HISTORY_FILES=(
  "$HOME/.HISTFILE"
  "$HOME/.bash_history"
  "$HOME/.config/litecli/history"
  "$HOME/.local/share/nix/repl-history"
  "$HOME/.mongodb/mongosh/mongosh_repl_history"
  "$HOME/.mongodb/mongosh/{*_log,*_history}"
  "$HOME/.node_repl_history"
  "$HOME/.npm/_logs"
  "$HOME/.psql_history"
  "$HOME/.python_history"
  "$HOME/.sqlite_history"
  "$HOME/.tig_history"
  "$HOME/.ts_node_repl_history"
  # "$HOME/.zsh_history"
)

for file in "${HISTORY_FILES[@]}"; do
  FILENAME="$(basename "$file")"
  [ -f "$file" ] && rm -f "$file" && echo "Remove $FILENAME"
done

unset -v file FILENAME HISTORY_FILES
