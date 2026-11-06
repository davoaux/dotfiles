{
  pkgs,
  lib,
  config,
  ...
}:

let
  homeDir = config.home.homeDirectory;
in
{
  # provides prompt_pure_setup on the fpath
  home.packages = [ pkgs.pure-prompt ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    dotDir = "${config.xdg.configHome}/zsh";

    defaultKeymap = "viins";
    envExtra = ''
      export KEYTIMEOUT=1
    '';

    history = {
      path = "${homeDir}/.histfile";
      size = 5000;
      save = 5000;
      ignoreAllDups = true;
      ignoreSpace = true;
      share = true;
    };

    autocd = false;

    plugins = [
      {
        name = "zsh-autopair";
        src = pkgs.zsh-autopair;
        file = "share/zsh/zsh-autopair/autopair.zsh";
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

    shellAliases =
      let
        projectsDir = lib.concatStringsSep " " (
          [
            "${homeDir}/Development"
            "${homeDir}/.dotfiles"
          ]
          ++ (if pkgs.stdenv.hostPlatform.isDarwin then [ "${homeDir}/IdeaProjects" ] else [ ])
        );
      in
      {
        ls = "ls --color=auto";
        l = "ls -lah";
        rm = "rm -i";
        k = "kubectl";
        docker-stop-all = "docker stop $(docker ps -a -q)";
        docker-remove-all = "docker rm $(docker ps -a -q)";
        fonts = "fc-list : family | sort | uniq | fzf";
        nixdev = "nix develop -c $SHELL \"$@\"";
        nixswitch = "home-manager switch --flake ${homeDir}/.dotfiles#$(hostname)";
        projects = "cd \"$(fd . ${projectsDir} --max-depth 1 | fzf)\"";
      };

  };
}
