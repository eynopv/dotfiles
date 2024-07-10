export FZF_BASE="$HOME/.local/share/nvim/plugged/fzf"
export PATH=$PATH:$FZF_BASE/bin

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="simple"

plugins=(z fzf zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='neovim'
fi

export PATH=$PATH:$HOME/.local/bin

# Golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

# Android
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin
export ANDROID_HOME=$HOME/Android
export ANDROID_SDK_ROOT=$HOME/Android
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
#export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
#export ADB_SERVER_SOCKET=tcp:$WSL_HOST:5037
#export REACT_NATIVE_PACKAGER_HOSTNAME=$(ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

# zig
export PATH=$PATH:$HOME/.local/bin/zig/zig-linux-x86_64-0.13.0

# neovim
export PATH=$PATH:$HOME/.local/bin/nvim/bin
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

# Nitor NDT
eval "$(nameless-dt-register-complete --nep-function)"

# Turso
export PATH="/home/eynopv/.turso:$PATH"

# pnpm
# also includes path to node and other tools
export PNPM_HOME="/home/eynopv/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
alias pn="pnpm"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# notes
alias notes="(cd ~/gnotes/notes; vim .)"
