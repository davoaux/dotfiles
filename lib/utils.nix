rec {
  # Returns all .nix file paths found directly inside `dir`
  nixFilesIn =
    dir:
    map (file: dir + "/${file}") (
      builtins.filter (f: builtins.match ".*\\.nix$" f != null) (
        builtins.attrNames (builtins.readDir dir)
      )
    );

  # Returns every module file in the given `modules/<name>` directories
  modulesFrom = names: builtins.concatMap (name: nixFilesIn (../modules + "/${name}")) names;
}
