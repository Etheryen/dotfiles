# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fix git fd 14 issue
unset ZSH_AUTOSUGGEST_USE_ASYNC

# Custom aliases
alias vim="nvim"
alias cat="bat --paging=never"
alias ls="eza --icons --git"
alias ll="eza -a -l --icons --git --git-repos"
alias l="ll"
alias llt="eza -1 --icons --tree --git-ignore"
alias search="fd --type f --hidden --exclude .git | fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"
alias gsearch="fd . / --type f --hidden --exclude .git | fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"
alias hollywood="docker run --rm -it bcbcarl/hollywood"

alias u="sudo dnf update -y && sudo flatpak upgrade -y && rustup update && sudo fwupdmgr refresh --force && sudo fwupdmgr get-updates && sudo fwupdmgr update"
alias bills="bills --header \"# Faktura\" --file ~/SyncThingFedora/ŁukaszCiwoniuk/_Important/Rozliczenia.md"
