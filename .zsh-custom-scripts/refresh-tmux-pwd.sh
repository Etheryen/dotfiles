autoload -Uz add-zsh-hook
tmux-refresh-pwd() { tmux refresh-client -S 2>/dev/null }
add-zsh-hook chpwd tmux-refresh-pwd
