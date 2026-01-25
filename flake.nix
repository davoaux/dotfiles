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
      # attribute set containing the host profiles and it's used system
      hostProfileToSystem = {
        "desktop" = "x86_64-linux";
        "work-laptop" = "aarch64-darwin";
      };

      # function to create the home-manager configuration for a given host profile
      mkHome = hostProfile: {
        pkgs = nixpkgs.legacyPackages.${hostProfileToSystem.${hostProfile}};
        extraSpecialArgs = { inherit hostProfile; };
        modules = [ ./home/home.nix ];
      };
    in
    {
      formatter = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-darwin" ] (
        system: nixpkgs.legacyPackages.${system}.nixfmt-tree
      );
      homeConfigurations = {
        "tiramisu" = home-manager.lib.homeManagerConfiguration (mkHome "desktop");
        "GV-M-MJXVF4TNJX" = home-manager.lib.homeManagerConfiguration (mkHome "work-laptop");
      };
    };
}
