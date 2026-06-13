{
  config,
  pkgs,
  lib,
}:

{
  username = "david";
  homeDirectory = "/Users/david";
  extraPackages = with pkgs; [ claude-code ];
  extraModules = [
    "ghostty"
    "idea"
  ];
  extraSessionVariables = { };
}
