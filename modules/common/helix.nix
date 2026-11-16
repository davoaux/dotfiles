{ pkgs, ... }:

{
  programs.helix = {
    enable = true;

    extraPackages = with pkgs; [
      shellcheck
      shfmt

      # language servers
      bash-language-server
      gopls
      lua-language-server
      nil
    ];

    settings = {
      theme = "yo_light";

      editor = {
        cursorline = false;
        mouse = true;
        scrolloff = 5;
        line-number = "absolute";
        true-color = true;
        auto-pairs = true;
        search.smart-case = true;
        soft-wrap.enable = false;
        default-yank-register = "+";

        whitespace = {
          render = "none";
          characters = {
            tab = "»";
            tabpad = "-";
            newline = "↲";
            space = "·";
          };
        };
      };

      keys.normal = {
        "F5" = ":toggle-option whitespace.render all none";

        up = "no_op";
        down = "no_op";
        left = "no_op";
        right = "no_op";

        space = {
          q = ":buffer-close";
        };

        "C-S-f" = "global_search";
        "C-S-k" = "code_action";
      };
    };
  };
}
