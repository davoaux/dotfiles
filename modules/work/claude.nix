{ pkgs, ... }:

{
  # Remote OAuth servers need a one-time authentication from `/mcp`.
  programs.claude-code.mcpServers = {
    fff = {
      command = "${pkgs.fff-mcp}/bin/fff-mcp";
    };
    atlassian = {
      type = "http";
      url = "https://mcp.atlassian.com/v1/mcp";
    };
    sourcegraph = {
      type = "http";
      url = "https://glovo.sourcegraph.com/.api/mcp/all";
    };
    # Grafana access, see https://dev.deliveryhero.net/docs/default/group/developer-platform/developer-infrastructure/cloud-application-platform/cli/
    dp-devinfra = {
      command = "dp-devinfra";
      args = [ "mcp" ];
    };
  };
}
