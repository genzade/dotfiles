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

To install this on a fresh macbook

- Set up your ssh keys (do this part manually)

run

```shell
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/genzade/dotfiles/main/bin/dotfiles)"
```

```shell
$ git clone git@github.com:genzade/dotfiles.git
$ ./dotfiles/install.sh
```
