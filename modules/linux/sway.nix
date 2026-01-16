{ ... }:

{
  home.file = {
    ".config/sway/config".source = ../../sway/config;

    ".config/sway/status.sh" = {
      source = ../../sway/status.sh;
      executable = true;
    };

    "Pictures/wallpapers/file.jpg".source = ../../wp/file.jpg;
  };
}
