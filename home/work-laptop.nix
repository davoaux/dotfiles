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
  ];
  extraModules = [
    "fonts"
    "ghostty"
    "idea"
    "work"
  ];
  extraSessionVariables = {
    OPENCODE_CONFIG = "/Users/david.ruiz/.config/opencode/opencode-nix.jsonc";
  };
}
