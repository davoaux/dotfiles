{ ... }:

{
  programs.zsh.initContent = ''
    export HOMEBREW_GITHUB_API_TOKEN=$(gh auth token 2>/dev/null)
  '';
}
