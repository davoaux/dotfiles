{ ... }:

{
  programs.zsh.loginExtra = ''
    if [[ -z "$WAYLAND_DISPLAY" ]] && [[ "$(tty)" == "/dev/tty1" ]]; then
      exec sway --unsupported-gpu
    fi
  '';
}
