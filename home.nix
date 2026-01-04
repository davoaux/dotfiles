{ config, pkgs, lib, ... }:

{
  home = {
    username = "david";
    homeDirectory = "/home/david";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "25.11";

    packages = with pkgs; [
      jq
    ];

    sessionVariables = {
      # should the /usr/localgo/bin entry be set here?
      PATH = "$HOME/.local/bin:$HOME/bin:/usr/local/go/bin:$PATH";
      EDITOR = "nvim";
      MANPAGER = "nvim +Man!";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;

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

    initContent = lib.mkMerge [
      # zsh completion
      (lib.mkOrder 550 ''
        zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
      '')
      # pure-prompt-theme plugin
      (lib.mkOrder 550 ''
        PURE_PROMPT_SYMBOL="$"
        PURE_PROMPT_VICMD_SYMBOL="<$>"
      '')
      # zsh-autopair plugin
      (lib.mkOrder 1000 ''
        autopair-init
      '')
      # pure-prompt-theme plugin
      (lib.mkOrder 1000 ''
        autoload -U promptinit; promptinit
        prompt pure
      '')
    ];

    shellAliases = {
      ls = "ls --color=auto";
      l = "ls -lah";
      rm = "rm -i";
      k = "kubectl";
      vi = "nvim";
      fonts = "fc-list : family | sort | uniq | fzf";
    };

  };
}
