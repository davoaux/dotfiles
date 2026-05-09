{ lib, ... }:
{
  # Allows unfree packages
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "lexima.vim" ];

  system.defaults.".GlobalPreferences"."com.apple.mouse.scaling" = -1.0; # Sets the mouse tracking speed. Found in the “Mouse” section of “System Preferences”. Set to -1.0 to disable mouse acceleration.
  system.defaults.dock.autohide = true; # Whether to automatically hide and show the dock. The default is false.
  system.defaults.dock.show-recents = false; # Show recent applications in the dock. The default is true.

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}
