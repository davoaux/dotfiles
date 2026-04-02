{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    withRuby = false;
    withNodeJs = false;
    withPython3 = false;

    plugins = [
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
    ];

    extraPackages = with pkgs; [
      shellcheck
      shfmt

      # language servers
      bash-language-server
      gopls
      lua-language-server
      nil
    ];
  };

  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/nvim";
    recursive = true;
  };
}
