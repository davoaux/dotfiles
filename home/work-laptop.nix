{
  config,
  pkgs,
  lib,
}:

{
  username = "david.ruiz";
  homeDirectory = "/Users/david.ruiz";
  extraPackages = with pkgs; [
    gh
    pnpm # needed to periodically sync @glovo/ai-prompts-cli
    pi-coding-agent
  ];
  extraModules = [
    "work"
    "ghostty"
  ];
  extraSessionVariables = { };
}
