{ pkgs, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
  fff-mcp = inputs.fff.packages.${system}.fff-mcp;
in
{
  home.packages = [ fff-mcp ];

  home.file.".config/opencode/opencode-nix.jsonc".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/config.json";
    instructions = [ "~/.config/opencode/AGENTS.md" ];
    lsp = true;
    permission = {
      external_directory = {
        "*" = "ask";
        "~/IdeaProjects/**" = "allow";
      };
    };
    mcp = {
      fff = {
        type = "local";
        command = [ "${fff-mcp}/bin/fff-mcp" ];
        enabled = true;
      };
    };
  };

  home.file.".config/opencode/AGENTS.md".text = ''
    For any file search or grep in the current git-indexed directory, use fff tools.
  '';
}
