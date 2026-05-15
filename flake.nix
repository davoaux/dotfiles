{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:nix-darwin/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    ghostty.url = "github:ghostty-org/ghostty";
    ghostty.inputs.nixpkgs.follows = "nixpkgs";

    sf-mono-liga-src.url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
    sf-mono-liga-src.flake = false;
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      darwin,
      self,
      ...
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
        import ./home/${hostProfile}.nix {
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
          extraSpecialArgs = { inherit hostProfile; };
          modules = [
            ./home/home.nix
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

            # TODO autoload modules in darwin directory
            ./darwin/configuration.nix
            ./darwin/ollama.nix
            ./darwin/wm.nix

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
              home-manager.extraSpecialArgs = { inherit hostProfile; };
              home-manager.users.${hostConfig.username} = ./home/home.nix;
            }
          ];
        };
    in
    {
      formatter = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-darwin" ] (
        system: nixpkgs.legacyPackages.${system}.nixfmt-tree
      );

      homeConfigurations = {
        "tiramisu" = mkHome "arch";
        "GV-M-MJXVF4TNJX" = mkHome "work-laptop";
      };

      darwinConfigurations = {
        "flat" = mkDarwin "desktop";
      };

    };
}
