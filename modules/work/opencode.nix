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
    references = {
      "ads-sponsoring-core" = {
        path = "~/IdeaProjects/ads-sponsoring-core/";
        description = "The repository for the backend service responsible of handling the sponsoring logic of partners and brands";
      };
    };
  };

  home.file.".config/opencode/AGENTS.md".text = ''
    For any file search or grep in the current git-indexed directory, use fff tools.
  '';
}
