{
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    dotDir = "${config.xdg.configHome}/zsh";

    defaultKeymap = "viins";
    envExtra = ''
      export KEYTIMEOUT=1
    '';

    history = {
      path = "$HOME/.histfile";
      size = 1000;
      save = 1000;
      ignoreAllDups = true;
      ignoreSpace = true;
      share = true;
    };

    autocd = false;

    plugins = [
      {
        name = "zsh-autopair";
        src = pkgs.fetchFromGitHub {
          owner = "hlissner";
          repo = "zsh-autopair";
          rev = "master";
          sha256 = "sha256-3zvOgIi+q7+sTXrT+r/4v98qjeiEL4Wh64rxBYnwJvQ=";
        };
      }
      {
        name = "pure-prompt-theme";
        src = pkgs.fetchFromGitHub {
          owner = "sindresorhus";
          repo = "pure";
          rev = "main";
          sha256 = "sha256-AZSxP2g6BWoxyiSQH7yzbbbfGcwD8jgnXPPfcYwJUL0=";
        };
      }
    ];

    initContent =
      let
        zshBeforeComp = lib.mkOrder 550;
        zshGeneral = lib.mkOrder 1000;

        autopairCfg = zshGeneral "autopair-init";
        completionCfg = zshBeforeComp ''
          zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
        '';
        purePromptCfg = lib.mkMerge [
          (zshBeforeComp ''
            PURE_PROMPT_SYMBOL="$"
            PURE_PROMPT_VICMD_SYMBOL="<$>"
          '')
          (zshGeneral ''
            autoload -U promptinit; promptinit
            prompt pure
          '')
        ];
      in
      lib.mkMerge [
        autopairCfg
        completionCfg
        purePromptCfg
      ];

    # Linux-specific sway startup
    loginExtra = lib.mkIf (pkgs.stdenv.isLinux) ''
      if [[ -z "$WAYLAND_DISPLAY" ]] && [[ "$(tty)" == "/dev/tty1" ]]; then
        exec sway --unsupported-gpu
      fi
    '';

    shellAliases = lib.mkMerge [
      {
        ls = "ls --color=auto";
        l = "ls -lah";
        rm = "rm -i";
        k = "kubectl";
        fonts = "fc-list : family | sort | uniq | fzf";
        docker-stop-all = "docker stop $(docker ps -a -q)";
        hms = "home-manager switch --flake ${config.home.homeDirectory}/.dotfiles#$(hostname)";
        nixdevelop = "nix develop -c $SHELL \"$@\"";
      }
      (lib.mkIf (pkgs.stdenv.isDarwin) {
        dev = "cd \"$(fd . ${config.home.homeDirectory}/IdeaProjects --max-depth 1 | fzf)\"";
      })
    ];

  };
}
