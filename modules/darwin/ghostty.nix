{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    # It's not currently possible to build Ghostty with Nix on macOS due to
    # missing Swift 6 and xcodebuild support in the Nix ecosystem.
    package = with pkgs; if stdenv.isDarwin then ghostty-bin else ghostty;

    settings = {
      theme = "Nvim Dark";
    };
  };
}
