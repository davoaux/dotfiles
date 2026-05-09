{ pkgs, ... }:

{
  launchd.user.agents.ollama = {
    command = "${pkgs.ollama}/bin/ollama serve";
    serviceConfig = {
      Label = "com.ollama.serve";
      RunAtLoad = true;
      KeepAlive = true;
      StandardOutPath = "/tmp/ollama.log";
      StandardErrorPath = "/tmp/ollama.err";
      EnvironmentVariables = {
        OLLAMA_HOST = "0.0.0.0";
        OLLAMA_ORIGINS = "*";
      };
  };
}
