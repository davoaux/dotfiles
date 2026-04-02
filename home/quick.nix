{ pkgs, ... }:

{
  username = "davoaux";
  homeDirectory = "/home/davoaux";
  extraPackages = with pkgs; [ xclip ];
  extraModules = [ ];
  extraSessionVariables = { };
}
