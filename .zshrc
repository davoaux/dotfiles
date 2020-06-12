# pywal: Applying the theme to new terminals
#(cat ~/.cache/wal/sequences &)

export ZSH="/home/parelkobra/.oh-my-zsh"

#ZSH_THEME="ys"
#ZSH_THEME="steeef"
#ZSH_THEME="risto"
ZSH_THEME="spaceship"

# alias
[ -f "$HOME/.config/.alias" ] && source $HOME/.config/.alias

# zsh plugins
plugins=(git fzf zsh-interactive-cd)
source $ZSH/oh-my-zsh.sh

# zsh-autopair
if [[ ! -d ~/.zsh-autopair ]]; then
  git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
fi
source ~/.zsh-autopair/autopair.zsh
autopair-init

# fuzzy finder
export FZF_DEFAULT_OPTS='--height 40% --reverse'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# default programs
export VISUAL=nvim
export EDITOR=$VISUAL
export TERMINAL=alacritty
export BROWSER=firefox

# general variables
export LESSHISTFILE="-"
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# setup path
export PATH="$PATH:$HOME/.local/bin:$HOME/scripts"
export PATH="$PATH:$HOME/nodejs/bin"  # nodejs
