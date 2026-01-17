#!/usr/bin/env bash

set -e

if ! type -p nix &>/dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --diagnostic-endpoint=""
fi

[[ ! -d ~/.dotfiles ]] && git clone https://github.com/davoaux/dotfiles.git ~/.dotfiles
[[ ! -d ~/bin ]] && git clone https://github.com/davoaux/bin.git ~/bin

# install usb-notifier
if [[ "$OSTYPE" = "linux"* ]]; then
  if [[ -f ~/bin/usb-notifier/install.sh && -x ~/bin/usb-notifier/install.sh ]]; then
    ! sudo ~/bin/usb-notifier/install.sh && echo "usb-notifier installation failed - check output for missing dependencies"
  fi
fi

echo "Bootstrap complete. Run 'home-manager switch --flake ~/.dotfiles#$(hostname)' to finish setup"
