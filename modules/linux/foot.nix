{ ... }:

{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "Source Code Pro:size=12";
        include = "/usr/share/foot/themes/nvim-dark";
      };

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
