# general
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
abbr vimrc "$EDITOR $XDG_CONFIG_HOME/nvim/init.vim"
abbr reload "source $__fish_config_dir/config.fish"

# git
abbr g git
abbr gl "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
abbr gs "git status --short"
abbr ga "git add -p"
abbr gp "git push origin master"
abbr gauto 'git add -A && git commit -m 'auto-commit' && git push'

abbr yadml "yadm log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
abbr yadms "yadm status --short"
abbr yadma "yadm add -u"
abbr yadmc "yadm commit -m 'auto-commit'"
abbr yadmp "yadm push origin master"
abbr yadmauto "yadm add -u && yadm commit -m 'auto-commit' && yadm push origin master"

# misc
abbr mongo 'mongo --norc'
abbr sqlite3 'sqlite3 -init "$XDG_CONFIG_HOME"/sqlite3/sqliterc'
abbr twitch 'concat -client-id "$TWITCHID" -vod '
abbr volume 'alsamixer -g'
abbr vswap 'cd $HOME/.local/share/nvim/swap && ls && rm -I *'
abbr wget 'wget --hsts-file=$XDG_CACHE_HOME/wget-hsts'

# bookmarks
abbr stack '$EDITOR $HOME/workspace/STACK.md'
abbr wv 'cd $HOME/pictures/misc/.c/v && ls'
