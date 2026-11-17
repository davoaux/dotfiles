{ ... }:

{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    # base16 uses the terminal palette, so it follows the light/dark theme
    defaultOptions = [ "--color=base16" ];
  };
}
