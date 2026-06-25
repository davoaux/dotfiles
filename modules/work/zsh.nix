{ ... }:

{
  programs.zsh.shellAliases = {
    # it might not work, if it doesn't run:
    # 1. gh auth login --with-token <<< "ghp_yourtoken" (https://github.com/settings/tokens)
    # 2. nixswitch
    # 3. glovo-ai-sync
    glovo-ai-sync = "pnpm dlx @glovo/ai-prompts-cli@latest setup-global";
  };

  programs.zsh.initContent = ''
    export GLOVO_NPM_TOKEN=$(gh auth token 2>/dev/null)
  '';
}
