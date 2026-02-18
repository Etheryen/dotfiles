# --- Source variables in interactive shells ---
if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi

# --- Source custom scripts ---
for file in ~/.bash-custom-scripts/*.sh; do
  . "$file"
done

# --- Starship prompt ---
# eval "$(starship init bash)"
PS1="\e[90m\w\e[0m\n\e[34m$\e[0m "
