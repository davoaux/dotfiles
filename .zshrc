export ZSH="/home/parelkobra/.oh-my-zsh"
export VISUAL=nvim
export EDITOR=$VISUAL
export TERMINAL=alacritty
export BROWSER=firefox-nightly

export LESSHISTFILE="-"
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export PATH="$PATH:$HOME/.local/bin:$HOME/scripts"
export PATH="$PATH:$HOME/nodejs/bin"  # nodejs

ZSH_THEME="spaceship"

[ -f "$HOME/.config/.alias" ] && source $HOME/.config/.alias

plugins=(
  fzf
  node
  zsh-interactive-cd
)

source $ZSH/oh-my-zsh.sh

if [[ ! -d ~/.zsh-autopair ]]; then
  git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
fi
source ~/.zsh-autopair/autopair.zsh
autopair-init

export FZF_DEFAULT_OPTS='--height 40% --reverse'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
