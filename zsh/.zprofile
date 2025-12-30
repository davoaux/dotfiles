# needed to integrate wayland and nvidia drivers (nvidia-580xx-dkms)
export XDG_SESSION_TYPE=wayland
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export WLR_NO_HARDWARE_CURSORS=1

# automatically start sway after login
if [[ -z "$WAYLAND_DISPLAY" ]] && [[ "$(tty)" == "/dev/tty1" ]]; then
  exec sway --unsupported-gpu
fi
