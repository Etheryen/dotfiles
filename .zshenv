# nvm 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# nvm end

# pnpm
export PNPM_HOME="/home/etheryen/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export MANPAGER="nvim +Man!"

export JAVA_HOME="/etc/alternatives/jre"

export GOPATH=$(go env GOPATH)
export GOBIN=$(go env GOBIN)

export BAT_THEME="Nord"
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"
export XDG_CONFIG_HOME="$HOME/.config"

. "$HOME/.cargo/env"

export PATH=$PATH:$GOPATH/bin:$HOME/apps/bin:/usr/local/go/bin
