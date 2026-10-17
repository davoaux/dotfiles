{
  config,
  pkgs,
  hostConfig,
  ...
}:

let
  utils = import ../lib/utils.nix;

  # Function to retrieve modules to import
  importFrom = dirs: builtins.concatMap (d: utils.nixFilesIn (../modules + "/${d}")) dirs;
in
{
  home = {
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "25.11";

    # Common packages, session path and variables shared across all profiles
    packages =
      with pkgs;
      [
        fd
        jq
        opencode
        pfetch
        ripgrep
      ]
      ++ hostConfig.extraPackages;

    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
      "${config.home.homeDirectory}/bin"
    ];

    sessionVariables = {
      EDITOR = "nvim";
      MANPAGER = "nvim +Man!";
    }
    // hostConfig.extraSessionVariables;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # Import modules
  imports = importFrom ([ "common" ] ++ hostConfig.extraModules);

}
