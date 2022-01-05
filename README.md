# dotfiles

This repository contains configuration files for programs that I use (or used to use) on a day to day basis.

## Install

Clone the repository and use [stow](https://www.gnu.org/software/stow/) to create the symlinks of the packages you want

```sh
git clone https://github.com/davoaux/dotfiles.git ~/.dotfiles --depth=1
cd ~/.dotfiles
stow nvim zsh x # and so on, or use */ instead to symlink all the packages
```

You can pass the `n` and `v` options to **stow** in order preview the changes before modifying the filesystem
