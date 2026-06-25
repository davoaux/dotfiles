{
  nixpkgs,
  home-manager,
  darwin,
  self,
}:

let
  utils = import ./utils.nix;

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
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
      config = { };
    };

  # Standalone home-manager configuration (e.g. arch/Linux, work-laptop)
  mkHome =
    hostProfile:
    let
      system = hostProfileToSystem.${hostProfile};
      hostConfig = mkHostConfig hostProfile;
    in
    home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {
        inherit hostProfile;
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

  # nix-darwin system configuration
  mkDarwin =
    hostProfile:
    let
      system = hostProfileToSystem.${hostProfile};
      hostConfig = mkHostConfig hostProfile;
      specialArgs = {
        inherit hostProfile;
        inputs = self.inputs;
      };
    in
    darwin.lib.darwinSystem {
      inherit system specialArgs;
      modules = [
        (
          { ... }:
          {
            nix.enable = false;
          }
        )
      ]
      ++ utils.nixFilesIn ../darwin
      ++ [
        {
          system.primaryUser = hostConfig.username;
          users.users.${hostConfig.username} = {
            name = hostConfig.username;
            home = hostConfig.homeDirectory;
          };
        }

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = false;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {
            inherit hostProfile;
            inputs = self.inputs;
          };
          home-manager.users.${hostConfig.username} = ../home/home.nix;
        }
      ];
    };
in
{
  inherit mkHome mkDarwin;
}
