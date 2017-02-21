#!/bin/sh

echo 'install'
if [[ "$(uname)" == "Darwin" ]]; then

  # colorscheme setup

  echo 'base16'
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

fi
