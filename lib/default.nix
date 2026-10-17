{
  nixpkgs,
  home-manager,
  self,
}:

let
  # attribute set containing the host profiles and their used system
  hostProfileToSystem = {
    "arch" = "x86_64-linux";
    "desktop" = "aarch64-darwin";
    "work-laptop" = "aarch64-darwin";
  };

  # Load host config data from the per-host file
  mkHostConfig =
    hostProfile:
    let
      system = hostProfileToSystem.${hostProfile};
    in
    import ../home/${hostProfile}.nix {
      # allowUnfree is required here because host configs list unfree packages
      # (e.g. claude-code) and are evaluated outside of Home Manager's pkgs
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
      config = { };
    };

  # Standalone home-manager configuration
  mkHome =
    hostProfile:
    let
      system = hostProfileToSystem.${hostProfile};
      hostConfig = mkHostConfig hostProfile;
    in
    home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {
        inherit hostConfig;
        inputs = self.inputs;
      };
      modules = [
        ../home/home.nix
        {
          home.username = hostConfig.username;
          home.homeDirectory = hostConfig.homeDirectory;
        }
      ];
    };
in
{
  inherit mkHome;
}
