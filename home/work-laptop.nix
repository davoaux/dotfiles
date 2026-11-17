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
    username = "david.ruiz";
    homeDirectory = "/Users/david.ruiz";
    packages = with pkgs; [
      gh
      pnpm # needed to periodically sync @glovo/ai-prompts-cli
    ];
  };
}
