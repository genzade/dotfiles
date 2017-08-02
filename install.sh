#!/bin/sh

echo 'install'

if [[ "$(uname)" == "Darwin" ]]; then

  # colorscheme setup
  echo 'install base16'
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

  # fuzzy finder setup
  echo 'install fzf'
  brew install fzf
  /usr/local/opt/fzf/install
fi
