{
  config,
  pkgs,
  lib,
}:

{
  username = "david.ruiz";
  homeDirectory = "/Users/david.ruiz";
  extraPackages = with pkgs; [ gh ];
  extraModules = [ "darwin" ];
  extraSessionVariables = { };
}
