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

## Work laptop extras

The following steps are required in the work laptop profile to install the `dp-devinfra` CLI used for the Grafana MCP.

Authenticate on the GitHub CLI:

```sh
gh auth login
```

Tap the Delivery Hero brew repo and install the CLI:

```sh
brew tap deliveryhero/dp-tap
brew install deliveryhero/dp-tap/dp-devinfra
```

After running `nixswitch`, the `HOMEBREW_GITHUB_API_TOKEN` will be set automatically in your shell via `gh auth token`.

