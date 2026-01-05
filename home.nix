{ config, pkgs, lib, ... }:

{
  home = {
    username = "david";
    homeDirectory = "/home/david";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "25.11";

    packages = with pkgs; [
      jq
    ];

    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/bin"
      "/usr/local/go/bin"
    ];
    sessionVariables = {
      # should the /usr/localgo/bin entry be set here?
      EDITOR = "nvim";
      MANPAGER = "nvim +Man!";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/zsh.nix
  ];

}
