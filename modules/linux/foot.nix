{ ... }:

{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "Source Code Pro:size=12";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      colors = {
        # Could be replaced if the [colors-dark] were replaced by [colors]
        # include = "/usr/share/foot/themes/nvim-dark";
        cursor = "14161b e0e2ea"; # NvimDarkGrey2 NvimLightGrey2
        foreground = "e0e2ea"; # NvimLightGrey2
        background = "14161b"; # NvimDarkGrey2

        selection-foreground = "e0e2ea"; # NvimLightGrey2
        selection-background = "4f5258"; # NvimDarkGrey4

        regular0 = "07080d"; # NvimDarkGrey1
        regular1 = "ffc0b9"; # NvimLightRed
        regular2 = "b3f6c0"; # NvimLightGreen
        regular3 = "fce094"; # NvimLightYellow
        regular4 = "a6dbff"; # NvimLightBlue
        regular5 = "ffcaff"; # NvimLightMagenta
        regular6 = "8cf8f7"; # NvimLightCyan
        regular7 = "c4c6cd"; # NvimLightGrey3

        bright0 = "2c2e33"; # NvimDarkGrey3
        bright1 = "ffc0b9"; # NvimLightRed
        bright2 = "b3f6c0"; # NvimLightGreen
        bright3 = "fce094"; # NvimLightYellow
        bright4 = "a6dbff"; # NvimLightBlue
        bright5 = "ffcaff"; # NvimLightMagenta
        bright6 = "8cf8f7"; # NvimLightCyan
        bright7 = "eef1f8"; # NvimLightGrey1
      };
    };
  };
}
