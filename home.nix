{ config, pkgs, lib, ... }:

{
  home = {
    username = "david";
    homeDirectory = "/home/david";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "25.11";

    packages = with pkgs; [
      foot
      grim
      jq
      mako
      mpv
      ripgrep
      slurp
    ];

    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
      "${config.home.homeDirectory}/bin"
    ];

    sessionVariables = {
      # needed to integrate wayland and nvidia drivers (nvidia-580xx-dkms)
      XDG_SESSION_TYPE = "wayland";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      WLR_NO_HARDWARE_CURSORS = "1";

      EDITOR = "nvim";
      MANPAGER = "nvim +Man!";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Automatically imports all nix files in the modules directory
  imports =
    let
      modulesDir = ./modules;
    in
    map (f: modulesDir + "/${f}")
    (lib.filter
      (lib.strings.hasSuffix ".nix")
      (builtins.attrNames (builtins.readDir ./modules))
    );

}
