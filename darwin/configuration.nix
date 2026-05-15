{
  pkgs,
  lib,
  inputs,
  ...
}:

let
  fontOverlay = final: prev: {
    sf-mono-liga-bin = prev.stdenvNoCC.mkDerivation {
      pname = "sf-mono-liga-bin";
      version = "dev";
      src = inputs.sf-mono-liga-src;
      dontConfigure = true;
      installPhase = ''
        mkdir -p $out/share/fonts/opentype
        cp -R $src/*.otf $out/share/fonts/opentype/
      '';
    };
  };
in
{
  nixpkgs.overlays = [ fontOverlay ];

  environment.systemPackages = with pkgs; [ ollama ];

  system.defaults.".GlobalPreferences"."com.apple.mouse.scaling" = 1.0; # Sets the mouse tracking speed. Found in the “Mouse” section of “System Preferences”. Set to -1.0 to disable mouse acceleration.
  system.defaults.dock.autohide = true; # Whether to automatically hide and show the dock. The default is false.
  system.defaults.dock.show-recents = false; # Show recent applications in the dock. The default is true.

  fonts.packages = with pkgs; [ sf-mono-liga-bin ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}
