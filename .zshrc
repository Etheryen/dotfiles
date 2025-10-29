# --- Source custom environment scripts ---
for file in ~/.zsh-custom-scripts/*.sh; do
  [ -r "$file" ] && source "$file"
done

# --- Aliases ---
alias vim="nvim"
alias cat="bat --paging=never"
alias ls="eza --icons --git"
alias ll="eza -a -l --icons --git --git-repos"
alias l="ll"
alias llt="eza -1 --icons --tree --git-ignore"
alias search="fd --type f --hidden --exclude .git | fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"
alias gsearch="fd . / --type f --hidden --exclude .git | fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"
alias hollywood="docker run --rm -it bcbcarl/hollywood"
alias u="sudo dnf update -y && sudo flatpak upgrade -y && sudo fwupdmgr refresh --force && sudo fwupdmgr get-updates && sudo fwupdmgr update && rustup update"
alias bills="bills --header \"# Faktura\" --file ~/SyncThingFedora/ŁukaszCiwoniuk/_Important/Rozliczenia.md"

# --- Starship prompt ---
eval "$(starship init zsh)"

# --- Github Sources ---
source "$HOME/.zsh-github-sources/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh-github-sources/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
