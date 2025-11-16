HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history

unsetopt autocd

bindkey -v
export KEYTIMEOUT=1

autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

export JAVA_HOME="$HOME/.jdks/corretto-21.0.6/"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"

# inellij bundled maven/gradle
export PATH="/snap/intellij-idea-community/588/plugins/maven/lib/maven3/bin:$PATH"
export PATH="$HOME/.gradle/wrapper/dists/gradle-8.10-bin/deqhafrv1ntovfmgh0nh3npr9/gradle-8.10/bin/:$PATH"

if type go > /dev/null 2>&1; then
  export GOPATH=$(go env GOPATH)
  export PATH="$GOPATH/bin:$PATH"
fi

export EDITOR=nvim
export MANPAGER='nvim +Man!'

if (grep -qEi "(microsoft|WSL)" /proc/version &>/dev/null); then
  export DISPLAY=$(ip route | awk '{print $3; exit}'):0
  export LIBGL_ALWAYS_INDIRECT=1
fi

# Autopair plugin
if [[ ! -d $HOME/.zsh/zsh-autopair ]]; then
  mkdir -p $HOME/.zsh
  git clone https://github.com/hlissner/zsh-autopair $HOME/.zsh/zsh-autopair --depth=1
fi
source $HOME/.zsh/zsh-autopair/autopair.zsh
autopair-init

# Set up prompt theme
if [[ ! -d $HOME/.zsh/pure ]]; then
  mkdir -p $HOME/.zsh
  git clone https://github.com/sindresorhus/pure.git $HOME/.zsh/pure --depth=1
fi
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit

export PURE_PROMPT_SYMBOL="$"
export PURE_PROMPT_VICMD_SYMBOL="<$>"

prompt pure

# Set up k8s context helper
if [[ ! -d $HOME/.zsh/kube-ps1 ]]; then
  mkdir -p $HOME/.zsh
  git clone https://github.com/jonmosco/kube-ps1 $HOME/.zsh/kube-ps1 --depth=1
fi

# Kubernetes prompt helper
#source $HOME/.zsh/kube-ps1/kube-ps1.sh
#PROMPT='$(kube_ps1) '$PROMPT # or RPROMPT='$(kube_ps1)'

# TODO:
# - completion
#   - https://thevaluable.dev/zsh-completion-guide-examples/
#   - https://github.com/Phantas0s/.dotfiles/blob/master/zsh/completion.zsh

alias ls='ls --color=auto'
alias l='ls -lah'
alias grep='grep --color=auto'
alias rm='rm -i'
alias k=kubectl
alias vi=nvim
alias fonts="fc-list : family | sort | uniq | fzf"

alias reload="source $HOME/.zshrc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pnpm
export PNPM_HOME="/home/davoaux/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# nvm end
