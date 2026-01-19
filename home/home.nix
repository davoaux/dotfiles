{
  config,
  pkgs,
  lib,
  hostProfile,
  ...
}:

let
  # Function to retrieve modules to import
  importFrom =
    dirs:
    let
      importDir =
        collection:
        let
          modulesCollectionDir = ../modules + "/${collection}";
        in
        map (moduleFile: modulesCollectionDir + "/${moduleFile}") (
          lib.filter (lib.strings.hasSuffix ".nix") (
            builtins.attrNames (builtins.readDir modulesCollectionDir)
          )
        );
    in
    lib.flatten (map importDir dirs);

  # Import host-specific configuration data
  hostConfig = import ./${hostProfile}.nix { inherit config pkgs lib; };
in
{
  home = {
    username = hostConfig.username;
    homeDirectory = hostConfig.homeDirectory;

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "25.11";

    # Common packages, session path and variables shared across all profiles
    packages =
      with pkgs;
      [
        fd
        fzf
        jq
        opencode
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

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # Import modules
  imports = importFrom ([ "common" ] ++ hostConfig.extraModules);
}
