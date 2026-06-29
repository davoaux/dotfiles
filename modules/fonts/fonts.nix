{ pkgs, inputs, lib, ... }:

let
  sfMonoLiga = pkgs.stdenvNoCC.mkDerivation {
    pname = "sf-mono-liga-bin";
    version = "dev";
    src = inputs.sf-mono-liga-src;
    dontConfigure = true;
    installPhase = ''
      mkdir -p $out/share/fonts/opentype
      cp -R $src/*.otf $out/share/fonts/opentype/
    '';
  };

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
  home.packages = [
    sfMonoLiga
    berkeleyMono
  ];

  # On macOS, fontconfig is not used by native apps (including Ghostty).
  # Symlinking into ~/Library/Fonts makes fonts available to CoreText.
  # On Linux, home.packages is enough — fontconfig picks them up automatically.
  home.file = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
    "Library/Fonts/sf-mono-liga".source = "${sfMonoLiga}/share/fonts/opentype";
    "Library/Fonts/berkeley-mono".source = "${berkeleyMono}/share/fonts/opentype";
  };
}
