set -x SHELL fish
set -x TERMINAL alacritty
set -x VISUAL nvim
set -x EDITOR $VISUAL
set -x BROWSER chromium
set -x LANG 'en_US.UTF-8'

set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share
set -x GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
set -x LESSHISTFILE "-"
set -x NODE_REPL_HISTORY $XDG_DATA_HOME/node_repl_history
set -x SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history
