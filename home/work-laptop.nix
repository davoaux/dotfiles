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
    "work"
  ];

  home = {
    # TODO: set once the work laptop is provisioned
    username = "TBD";
    homeDirectory = "/Users/TBD";
    packages = with pkgs; [
      gh
    ];
  };
}
