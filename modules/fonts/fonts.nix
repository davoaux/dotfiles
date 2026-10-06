{ pkgs, inputs, lib, ... }:

let
  berkeleyMono = pkgs.stdenvNoCC.mkDerivation {
    name = "berkeley-mono";
    src = ./berkeley-mono.zip;
    nativeBuildInputs = [ pkgs.unzip ];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir -p $out/share/fonts/opentype
      cp berkeley-mono/*.otf $out/share/fonts/opentype/
    '';
  };
in
{
  home.packages = [ berkeleyMono ];

  # On macOS, fontconfig is not used by native apps (including Ghostty).
  # Symlinking into ~/Library/Fonts makes fonts available to CoreText.
  # On Linux, home.packages is enough — fontconfig picks them up automatically.
  home.file = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
    "Library/Fonts/berkeley-mono".source = "${berkeleyMono}/share/fonts/opentype";
  };
}
