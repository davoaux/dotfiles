{ config, pkgs, ... }:

let
  utils = import ../lib/utils.nix;
in
{
  # Modules shared by every host; host-specific ones are imported from home/<host>.nix
  imports = utils.modulesFrom [ "common" ];

  home = {
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "25.11";

    # Common packages, session path and variables shared across all profiles
    packages = with pkgs; [
      fd
      jq
      pfetch
      ripgrep
    ];

    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
      "${config.home.homeDirectory}/bin"
      "${config.home.homeDirectory}/.opencode/bin"
    ];

    sessionVariables = {
      EDITOR = "nvim";
      MANPAGER = "nvim +Man!";
    };
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
