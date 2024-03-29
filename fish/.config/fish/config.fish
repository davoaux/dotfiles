set fish_greeting

set -gx PATH /usr/local/sbin /usr/bin /usr/bin/core_perl ~/.local/bin \
~/.yarn/bin ~/.emacs.d/bin ~/.dotnet/tools ~/.local/share/gem/ruby/3.0.0/bin \
~/scripts $PATH

set -x SHELL fish
set -x TERMINAL alacritty
set -x TERM screen-256color-bce
set -x VISUAL nvim
set -x EDITOR $VISUAL
set -x BROWSER chromium
set -x LANG 'en_US.UTF-8'
set -x MANPAGER 'nvim +Man!'
set -x MANWIDTH 999

set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share
set -x GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
set -x LESSHISTFILE "-"
set -x NODE_REPL_HISTORY $XDG_DATA_HOME/node_repl_history

source ~/.config/fish/.secrets

if status is-login
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    startx
  end
end

complete -f -c dotnet -a "(dotnet complete)"

function fish_user_key_bindings
  fish_vi_key_bindings
  fzf_key_bindings
  bind -M insert -k nul accept-autosuggestion
end

function __fish_command_not_found_handler --on-event fish_command_not_found
    echo "fish: Unknown command '$argv'"
end

function mkcd --description 'Create and change to a new directory'
  mkdir $argv; and cd $argv
end

function config --description 'Browse my config files'
  set --local file (ls $XDG_CONFIG_HOME | fzf)
  if test -n "$file"
    nvim "$XDG_CONFIG_HOME/$file"
  end
end

function record --description 'Record video of my screen'
  ffmpeg -f x11grab -i :0.0 out.mkv
end

function opdf
  zathura $argv --fork
end

abbr vi nvim
abbr sudovi 'sudo nvim'
abbr l 'ls -lah'
abbr rm 'rm -i'
abbr o open
abbr sxiv 'sxiv -b'
abbr tmux 'tmux -u'
abbr diskspace 'df -H'
abbr yt youtube-dl
abbr zathura 'zathura --fork'

# configs
abbr shrc "$EDITOR $XDG_CONFIG_HOME/fish/config.fish"
abbr i3rc "$EDITOR $XDG_CONFIG_HOME/i3/config"
abbr termrc "$EDITOR $XDG_CONFIG_HOME/alacritty/alacritty.yml"
abbr vimrc "$EDITOR $XDG_CONFIG_HOME/nvim/init.lua"
abbr reload "source $__fish_config_dir/config.fish"

# git
abbr g git
abbr gl "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
abbr gs "git status --short"
abbr ga "git add -p"
abbr gp "git push origin master"
abbr gauto 'git add -A && git commit -m 'auto-commit' && git push'
abbr yadms "yadm status --short"
abbr yadma "yadm add -u"

# misc
abbr mongo 'mongo --norc'
abbr sqlite3 'sqlite3 -init "$XDG_CONFIG_HOME"/sqlite3/sqliterc'
abbr twitch 'concat -client-id "$TWITCHID" -vod '
abbr volume 'alsamixer -g'
abbr vswap 'cd $HOME/.local/share/nvim/swap && ls && rm -I *'
abbr wget 'wget --hsts-file=$XDG_CACHE_HOME/wget-hsts'

# bookmarks
abbr stack '$EDITOR $HOME/workspace/STACK.org'
abbr wv 'cd $HOME/pictures/misc/.c/v && ls'

set -x FZF_DEFAULT_OPTS "--no-mouse --height=100%"
