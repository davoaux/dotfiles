export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/scripts"
export PATH="$PATH:$HOME/nodejs/bin"  # nodejs

export ZSH="/home/parelkobra/.oh-my-zsh"
export TERMINAL=alacritty
export VISUAL=/usr/bin/nvim
export EDITOR=$VISUAL
export BROWSER=/usr/bin/chromium

export LESSHISTFILE="-"
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export FZF_DEFAULT_OPTS='--height 40% --reverse'

[ -f "$HOME/.config/zsh/.alias" ] && source $HOME/.config/zsh/.alias
[ -f "$HOME/.config/zsh/.functions" ] && source $HOME/.config/zsh/.functions
[ -f "$HOME/.fzf.zsh" ] && source $HOME/.fzf.zsh

ZSH_THEME="spaceship"
#ZSH_THEME="fishy"

plugins=(
  fzf
  node
  zsh-interactive-cd
)

if [[ ! -d ~/.zsh-autopair ]]; then
  git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
fi
source ~/.zsh-autopair/autopair.zsh
autopair-init

source $ZSH/oh-my-zsh.sh
