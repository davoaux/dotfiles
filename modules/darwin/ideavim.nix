{ config, ... }:

{
  # TODO only if intellij is installed
  home.file = {
    ".ideavimrc".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/ideavimrc/.ideavimrc";
  };
}
