# --- Source variables in interactive shells ---
if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi

# --- Source custom scripts ---
for file in ~/.bash-custom-scripts/*.sh; do
  . "$file"
done

# --- Starship prompt ---
eval "$(starship init bash)"
