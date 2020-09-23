export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/scripts"
export PATH="$PATH:$HOME/nodejs/bin"
export PATH="$PATH:$HOME/.emacs.d/bin"

export TERMINAL=alacritty
export VISUAL=/usr/bin/nvim
export EDITOR=$VISUAL
export BROWSER=/usr/bin/chromium

export LESSHISTFILE="-"
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export ZSH="/home/parelkobra/.oh-my-zsh"
export FZF_DEFAULT_OPTS="--height 40% --reverse --color \
	'fg:#ebdbb2,fg+:#ebdbb2,bg:#1d2021,bg+:#32302f,border:#ebdbb2,prompt:#fb4934,pointer:#fb4934,info:#8ec07c,spinner:#b8bb26'"

ZSH_THEME="spaceship"

plugins=(
  fzf
  node
  zsh-interactive-cd
)

source $ZSH/oh-my-zsh.sh
[ -f "$HOME/.config/zsh/.env" ] && source $HOME/.config/zsh/.env
[ -f "$HOME/.config/zsh/alias" ] && source $HOME/.config/zsh/alias
[ -f "$HOME/.config/zsh/functions" ] && source $HOME/.config/zsh/functions
[ -f "$HOME/.config/zsh/autopair" ] && source $HOME/.config/zsh/autopair
[ -f "$HOME/.fzf.zsh" ] && source $HOME/.fzf.zsh
