# --- Source custom scripts ---
for file in ~/.zsh-custom-scripts/*.sh; do
  [ -r "$file" ] && source "$file"
done

# --- Starship prompt ---
eval "$(starship init zsh)"

# --- Github Sources ---
source "$HOME/.zsh-github-sources/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh-github-sources/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
