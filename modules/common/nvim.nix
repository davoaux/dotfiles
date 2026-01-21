{ config, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
  };

  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/nvim";
    recursive = true;
  };
}
