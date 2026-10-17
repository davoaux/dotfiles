{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

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
      self,
      ...
    }:
    let
      lib = import ./lib {
        inherit
          nixpkgs
          home-manager
          self
          ;
      };
      inherit (lib) mkHome;
    in
    {
      formatter = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-darwin" ] (
        system: nixpkgs.legacyPackages.${system}.nixfmt-tree
      );
      homeConfigurations = {
        "tiramisu" = mkHome "arch";
        "GV-M-MJXVF4TNJX" = mkHome "work-laptop";
        "flat" = mkHome "desktop";
      };
    };
}
