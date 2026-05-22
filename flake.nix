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

    fff.url = "github:dmtrKovalenko/fff";
    fff.inputs.nixpkgs.follows = "nixpkgs";

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
      lib = import ./lib {
        inherit
          nixpkgs
          home-manager
          darwin
          self
          ;
      };
      inherit (lib) mkHome mkDarwin;
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
