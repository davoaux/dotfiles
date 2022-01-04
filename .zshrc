HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd
bindkey -v
export KEYTIMEOUT=1

autoload -Uz compinit
compinit

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/scripts
#export GOPATH=$(go env GOPATH)

export EDITOR=vim
#export EDITOR=nvim
#export MANPAGER='nvim +Man!'

if (grep -qEi "(microsoft|WSL)" /proc/version &>/dev/null); then
	export DISPLAY=$(ip route | awk '{print $3; exit}'):0
	export LIBGL_ALWAYS_INDIRECT=1
fi

# Set up prompt theme
if [[ ! -d $HOME/.zsh/pure ]]; then
  mkdir -p $HOME/.zsh
  git clone 'https://github.com/sindresorhus/pure.git' "$HOME/.zsh/pure" --depth=1
fi

fpath+=$HOME/.zsh/pure

autoload -U promptinit; promptinit
prompt pure

# TODO:
# - autopair
# - completion
#   - https://thevaluable.dev/zsh-completion-guide-examples/
#   - https://github.com/Phantas0s/.dotfiles/blob/master/zsh/completion.zsh

alias ls='ls --color=auto'
alias l='ls -lah'
alias rm='rm -i'

alias zshrc="$EDITOR $HOME/.zshrc"
alias vimrc="$EDITOR $HOME/.vimrc"
alias reload="source $HOME/.zshrc"

alias g=git
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs='git status --short'
alias ga='git add -p'
alias gp='git push'
