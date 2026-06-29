{
  config,
  pkgs,
  lib,
}:

{
  username = "david";
  homeDirectory = "/Users/david";
  extraPackages = with pkgs; [ claude-code whisky ];
  extraModules = [
    "fonts"
    "ghostty"
    "idea"
  ];
  extraSessionVariables = { };
}
