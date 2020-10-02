export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
  fzf
  node
  zsh-interactive-cd
)

source $ZSH/oh-my-zsh.sh

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

for file in $XDG_CONFIG_HOME/zsh/*; do
    source $file
done
