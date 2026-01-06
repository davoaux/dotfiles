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
      "/usr/local/go/bin" # should the /usr/localgo/bin entry be set here?
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

  imports = [
    ./modules/foot.nix
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/zsh.nix
  ];

}
