{ config, pkgs, ... }:

{
  home.sessionVariables.OPENCODE_CONFIG = "${config.home.homeDirectory}/.config/opencode/opencode-nix.jsonc";

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
        command = [ "${pkgs.fff-mcp}/bin/fff-mcp" ];
        enabled = true;
      };
    };
  };

  home.file.".config/opencode/AGENTS.md".text = ''
    For any file search or grep in the current git-indexed directory, use fff tools.
  '';
}
