{ pkgs, ... }:

let
  utils = import ../lib/utils.nix;
in
{
  imports = utils.modulesFrom [
    "ai"
    "fonts"
    "ghostty"
    "idea"
    "mole"
  ];

  home = {
    username = "david";
    homeDirectory = "/Users/david";
    packages = with pkgs; [ whisky ];
  };
}
