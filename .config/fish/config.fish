set fish_greeting

# path
set -gx PATH /usr/local/sbin /usr/bin /usr/bin/core_perl ~/.local/bin \
~/.yarn/bin ~/.emacs.d/bin ~/scripts $PATH

source $__fish_config_dir/env.fish
source $__fish_config_dir/.env.fish
source $__fish_config_dir/abbr.fish
source $__fish_config_dir/fzf.fish

if status is-login
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    $HOME/scripts/strtupx
  end
end

# key bindings
function fish_user_key_bindings
  fish_vi_key_bindings
  fzf_key_bindings
  bind -M insert -k nul accept-autosuggestion
end

function mkcd --description 'Create and change to a new directory'
  mkdir $argv; and cd $argv
end

function notes --description 'Browse my personal notes'
  cd $HOME/documents/notes
  set --local note (ls | fzf)
  if test -n "$note"
    nvim "$HOME/documents/notes/$note"
  end
end


function config --description 'Browse my config files'
  set --local file (ls $XDG_CONFIG_HOME | fzf)
  if test -n "$file"
    nvim "$XDG_CONFIG_HOME/$file"
  end
end
