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
      pkgs = nixpkgs.legacyPackages.${system};
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
in
{
  inherit mkHome;
}
