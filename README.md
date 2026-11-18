# dotfiles

This repository configurations for my different computers. They are managed using Nix.

## Install

Run the `bootstrap.sh` script which will clone this repository and setup
[Determinate Nix](https://determinate.systems/nix/) and write follow up
instructions to finish setting up the system.

```
curl -fsSL https://raw.githubusercontent.com/davoaux/dotfiles/refs/heads/master/bootstrap.sh | bash
```

Then setup on the `flake.nix` file the profile you want to install.
