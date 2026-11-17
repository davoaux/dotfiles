{ pkgs, ... }:

let
  utils = import ../lib/utils.nix;
in
{
  imports = utils.modulesFrom [ "wayland" ];

  home = {
    username = "davoaux";
    homeDirectory = "/home/davoaux";

    packages = with pkgs; [
      foot
      grim
      mako
      slurp
      zathura
    ];

    sessionVariables = {
      # needed to integrate wayland and nvidia drivers (nvidia-580xx-dkms)
      XDG_SESSION_TYPE = "wayland";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
  };
}
