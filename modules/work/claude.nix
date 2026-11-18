{ pkgs, ... }:

{
  programs.claude-code.mcpServers = {
    fff = {
      command = "${pkgs.fff-mcp}/bin/fff-mcp";
    };
  };
}
