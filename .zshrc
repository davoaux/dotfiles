export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="cloud"
ZSH_THEME_CLOUD_PREFIX="🦍"

plugins=(
  fzf
  node
  zsh-autopair
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

bindkey '^ ' autosuggest-accept

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

for file in $(ls -1A $XDG_CONFIG_HOME/zsh); do
    source $XDG_CONFIG_HOME/zsh/$file
done
