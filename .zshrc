export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/scripts"
export PATH="$PATH:$HOME/nodejs/bin"
export PATH="$PATH:$HOME/.cargo/bin"

export TERMINAL=alacritty
export VISUAL=/usr/bin/nvim
export EDITOR=$VISUAL
export BROWSER=/usr/bin/chromium

export LESSHISTFILE="-"
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export ZSH="/home/parelkobra/.oh-my-zsh"
export FZF_DEFAULT_OPTS='--height 40% --reverse'

export VIRTUAL_ENV_DISABLE_PROMPT=1

plugins=(
  fzf
  node
  zsh-interactive-cd
)

source $ZSH/oh-my-zsh.sh
[ -f "$HOME/.config/zsh/.alias" ] && source $HOME/.config/zsh/.alias
[ -f "$HOME/.config/zsh/.functions" ] && source $HOME/.config/zsh/.functions
[ -f "$HOME/.config/zsh/.themes" ] && source $HOME/.config/zsh/.themes
[ -f "$HOME/.config/zsh/.plugins" ] && source $HOME/.config/zsh/.plugins
[ -f "$HOME/.fzf.zsh" ] && source $HOME/.fzf.zsh
