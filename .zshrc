# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/parelkobra/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR=vim

export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export GOPATH=$(go env GOPATH)
export DISPLAY=$(ip route | awk '{print $3; exit}'):0
export LIBGL_ALWAYS_INDIRECT=1
