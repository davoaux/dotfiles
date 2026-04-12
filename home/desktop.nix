{
  config,
  pkgs,
  lib,
}:

{
  username = "david";
  homeDirectory = "/Users/david";
  extraPackages = [ ];
  extraModules = [ "ghostty" ];
  extraSessionVariables = { };
}
