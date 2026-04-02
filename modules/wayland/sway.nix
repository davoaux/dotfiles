{ config, ... }:

{
  home.file = {
    ".config/sway".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/sway";
    "Pictures/wallpapers/file.jpg".source = ../../wp/file.jpg;
  };
}
