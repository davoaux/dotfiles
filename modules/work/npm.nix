{ ... }:

{
  home.file.".npmrc".text = ''
    @glovo:registry=https://npm.pkg.github.com
    //npm.pkg.github.com/:_authToken=''${GLOVO_NPM_TOKEN}
  '';
}
