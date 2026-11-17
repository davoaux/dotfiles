{ config, lib, ... }:

{
  options.dotfiles.dir = lib.mkOption {
    type = lib.types.str;
    default = "${config.home.homeDirectory}/.dotfiles";
    description = ''
      Absolute path of this repository's checkout. Used for out-of-store
      symlinks (so edits apply without a switch) and for shell aliases.
    '';
  };
}
