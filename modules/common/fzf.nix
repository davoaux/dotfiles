{ ... }:

{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [ "--color=light" ]; # should be set based on system theme
  };
}
