{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      forSupportedSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);
    in
    {
      formatter = forSupportedSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);
      homeConfigurations = {
        # Desktop
        "tiramisu" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = {
            hostProfile = "desktop";
          };
          modules = [ ./home/home.nix ];
        };

        # Work laptop (macOS arm64)
        "GV-M-MJXVF4TNJX" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-darwin";
          extraSpecialArgs = {
            hostProfile = "work-laptop";
          };
          modules = [ ./home/home.nix ];
        };
      };
    };
}
