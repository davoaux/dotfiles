#!/usr/bin/env bash

set -e

if ! type -p nix &>/dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --diagnostic-endpoint=""
fi

[[ ! -d ~/.dotfiles ]] && git clone https://github.com/davoaux/dotfiles.git ~/.dotfiles
[[ ! -d ~/bin ]] && git clone https://github.com/davoaux/bin.git ~/bin

echo "Bootstrap complete. Run 'nix run home-manager -- switch --flake ~/.dotfiles#$(hostname)' to finish setup"
