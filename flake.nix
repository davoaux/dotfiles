{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      linuxPkgs = nixpkgs.legacyPackages."x86_64-linux";
      darwinPkgs = nixpkgs.legacyPackages."aarch64-darwin";
    in
    {
      homeConfigurations = {
        # Desktop
        "tiramisu" = home-manager.lib.homeManagerConfiguration {
          pkgs = linuxPkgs;
          extraSpecialArgs = { hostProfile = "desktop"; };
          modules = [ ./home/home.nix ];
        };

        # Work laptop (macOS arm64)
        "GV-M-MJXVF4TNJX" = home-manager.lib.homeManagerConfiguration {
          pkgs = darwinPkgs;
          extraSpecialArgs = { hostProfile = "work-laptop"; };
          modules = [ ./home/home.nix ];
        };
      };
    };
}
