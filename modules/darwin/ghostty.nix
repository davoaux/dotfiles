{ pkgs, lib, ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    # It's not currently possible to build Ghostty with Nix on macOS due to
    # missing Swift 6 and xcodebuild support in the Nix ecosystem.
    package = lib.mkForce pkgs.ghostty-bin;

    settings = {
      theme = "Nvim Dark";
    };
  };
}
