# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_CONFIG_HOME="$HOME/.config"
export TERMINAL="alacritty"
export EDITOR="emacs"
export VISUAL="emacs"
export PATH="$PATH:$HOME/opt/bin:$HOME/.npm-global/bin"

# --- DOTNET ---
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
export PATH=$PATH:$HOME/.dotnet/tools
# --- DOTNET ---

alias ls='ls --color=auto'
alias search="fd --type f --hidden --exclude .git | fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"
alias gsearch="fd . / --type f --hidden --exclude .git | fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"
alias bills="bills \"# Faktura\" ~/SyncthingNixOS/ŁukaszCiwoniuk/_Important/Rozliczenia.md"

alias copy="xclip -selection clipboard"
alias paste="xclip -selection clipboard -o"
alias from="pwd | copy"
alias to='cd $(paste)'

alias ne="emacs ~/dotfiles/configuration.nix"
alias nr="sudo nixos-rebuild switch"
alias u="sudo nixos-rebuild switch --upgrade-all"

br() { brightnessctl set "$1%"; }
red() { redshift -P -O "$1"; }
volume() { wpctl set-volume @DEFAULT_SINK@ "$1%"; }

PS1='[\u@\h \W]\$ '
