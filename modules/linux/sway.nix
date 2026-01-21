{ ... }:

{
  home.file = {
    ".config/sway/config".source = ../../config/sway/config;

    ".config/sway/status.sh" = {
      source = ../../config/sway/status.sh;
      executable = true;
    };

    "Pictures/wallpapers/file.jpg".source = ../../wp/file.jpg;
  };
}
