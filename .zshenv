export JAVA_HOME="/etc/alternatives/jre"

export GOPATH=$(go env GOPATH)
export GOBIN=$(go env GOBIN)

export BAT_THEME="gruvbox-dark"
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"
export XDG_CONFIG_HOME="$HOME/.config"

. "$HOME/.cargo/env"

export PATH=$PATH:$GOPATH/bin:$HOME/apps/bin:/usr/local/go/bin
