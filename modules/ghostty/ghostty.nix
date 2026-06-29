{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    # It's not currently possible to build Ghostty with Nix on macOS due to
    # missing Swift 6 and xcodebuild support in the Nix ecosystem.
    package = with pkgs; if stdenv.isDarwin then ghostty-bin else ghostty;

    settings = {
      theme = "dark:Nvim Dark,light:Alabaster";
      font-family = "Berkeley Mono";

      # split navigation
      keybind = [
        "super+shift+h=goto_split:left"
        "super+shift+j=goto_split:down"
        "super+shift+k=goto_split:up"
        "super+shift+l=goto_split:right"
      ];
    };
  };
}
