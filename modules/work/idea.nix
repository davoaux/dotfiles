{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ jetbrains.idea ];

  home.file = {
    ".ideavimrc".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/ideavimrc/.ideavimrc";
  };
}
