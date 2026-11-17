{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ jetbrains.idea ];

  home.file = {
    ".ideavimrc".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/ideavimrc/.ideavimrc";

    # Helix emulation for IdeaVim, pinned through flake.lock (https://github.com/chtenb/helix.vim)
    ".config/ideavim/helix.idea.vim".source = "${pkgs.helix-vim}/helix.idea.vim";
  };
}
