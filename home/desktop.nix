{
  config,
  pkgs,
  lib,
}:

{
  username = "david";
  homeDirectory = "/Users/david";
  extraPackages = with pkgs; [ whisky ];
  extraModules = [
    "ai"
    "fonts"
    "ghostty"
    "idea"
    "mole"
  ];
  extraSessionVariables = { };
}
