# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_CONFIG_HOME="$HOME/.config"
export TERMINAL="alacritty"
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="nvim +Man!"
export PATH="$PATH:$HOME/opt/bin:$HOME/.npm-global/bin"

# --- JAVA ---
. /etc/profile.d/jdk.sh
# --- JAVA ---
#
# --- DOTNET ---
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
export PATH=$PATH:$HOME/.dotnet/tools
# --- DOTNET ---

alias ls='ls --color=auto'
alias search="fd --type f --hidden --exclude .git | fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"
alias gsearch="fd . / --type f --hidden --exclude .git | fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"
alias u="sudo xbps-install -Su"
alias bills="bills \"# Faktura\" ~/SyncthingVoid/ŁukaszCiwoniuk/_Important/Rozliczenia.md"

alias copy="xclip -selection clipboard"
alias paste="xclip -selection clipboard -o"
alias from="pwd | copy"
alias to='cd $(paste)'

br() {
  brightnessctl set "$1%"
}

red() {
  redshift -P -O "$1"
}

volume() {
  wpctl set-volume @DEFAULT_SINK@ "$1%"
}

prompt_symbol() {
  if [[ $? -eq 0 ]]; then
    echo -e '\e[34m$\e[0m'
  else
    echo -e '\e[31m$\e[0m'
  fi
}

# PS1='[\u@\h \W]\$ ' # <- DEFAULT
PS1='\e[97m\w\e[0m $(prompt_symbol) '
