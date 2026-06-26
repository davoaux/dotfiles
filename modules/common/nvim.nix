{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    withRuby = false;
    withNodeJs = false;
    withPython3 = false;

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig

      nvim-treesitter.withAllGrammars

      blink-cmp

      telescope-nvim
      plenary-nvim
      fff-nvim

      neo-tree-nvim
      nui-nvim

      vim-fugitive
      lexima-vim
      vim-cool
      vim-rooter

      alabaster-nvim
      slimline-nvim
    ];

    initLua = builtins.readFile ../../config/nvim/init.lua;

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

  home.file.".config/nvim/lua" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/nvim/lua";
  };
}
