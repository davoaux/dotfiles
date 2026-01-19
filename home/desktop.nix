{
  config,
  pkgs,
  lib,
}:

{
  username = "david";
  homeDirectory = "/home/david";
  extraPackages = with pkgs; [
    foot
    grim
    mako
    slurp
  ];
  extraModules = [ "linux" ];
  extraSessionVariables = {
    # needed to integrate wayland and nvidia drivers (nvidia-580xx-dkms)
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}
