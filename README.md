# _dotfiles_

Repository containing all the automation and dotfiles required to setup my MacOS
machine after a fresh install.

- nvim
  - fully configured in lua
  - builtin lsp
  - completion with snippets
  - treesitter
  - and more
- tmux
  - tpm

See [install.sh](./install.sh) to get an overview of the installation of my current
setup on `MacOS`.

To install this on a fresh macbook

- Set up your ssh keys (do this part manually)
- Clone this repository in your home directory (`$HOME`) and run the install script

```shell
$ git clone git@github.com:genzade/dotfiles.git
$ ./dotfiles/install.sh
```
