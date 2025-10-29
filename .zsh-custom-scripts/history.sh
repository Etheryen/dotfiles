# before loading zsh-autosuggestions

setopt SHARE_HISTORY      # share command history between sessions
setopt INC_APPEND_HISTORY # append commands to history file as they’re entered
setopt HIST_IGNORE_DUPS   # avoid duplicates
setopt HIST_IGNORE_SPACE   # ignore commands that start with space

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
