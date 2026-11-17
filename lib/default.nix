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

  # Standalone home-manager configuration, built from the shared base
  # (home/home.nix) plus the host module (home/<hostProfile>.nix)
  mkHome =
    hostProfile:
    home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = hostProfileToSystem.${hostProfile};
        config.allowUnfree = true;
        overlays = [
          self.inputs.llm-agents.overlays.shared-nixpkgs
          (final: _prev: {
            fff-mcp = self.inputs.fff.packages.${final.stdenv.hostPlatform.system}.fff-mcp;
            # darwin-only package, evaluated lazily so other systems are unaffected
            mole = self.inputs.mole.packages.${final.stdenv.hostPlatform.system}.mole;
            # non-flake source tree, consumed as "${pkgs.helix-vim}/helix.idea.vim"
            helix-vim = self.inputs.helix-vim;
          })
        ];
      };
      modules = [
        ../home/home.nix
        ../home/${hostProfile}.nix
      ];
    };
in
{
  inherit mkHome;
}
