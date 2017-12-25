#!/bin/sh

echo '---------INSTALLATION-SCRIPT---------\n'

if [[ "$(uname)" == "Darwin" ]]; then

  # colorscheme setup
  # echo 'install base16'
  # git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

  # fuzzy finder setup
  echo 'installing fzf\n'
  brew install fzf

  echo 'installing fzf fuzzy completion\n'
  # To install useful key bindings and fuzzy completion:
  $(brew --prefix)/opt/fzf/install

  # tmux installation
  echo 'installing tmux\n'
  brew install tmux

  # ReattachToUserNamespace installation
  echo 'installing ReattachToUserNamespace\n'
  brew install reattach-to-user-namespace

  # asdf version manager. Supported languages include Ruby, Node.js, Elixir and more.
  echo 'installing asdf, the extendable version manager\n'
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.0
  echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
  echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc

  # tig: text-mode interface for Git
  echo 'installing tig (text-mode interface for Git)'
  brew install tig

  # openssl: general purpose cryptographic library
  echo 'installing openssl\n'
  brew install openssl

  # Programming language prerequisites and package managers
  echo 'installing libyaml\n'
  brew install libyaml # should come after openssl

  echo 'installing coreutils\n'
  brew install coreutils

  echo 'installing yarn\n'
  brew install yarn

  echo 'installing ImageMagick\n'
  brew install imagemagick

  # Use GPG Suite to encrypt, decrypt, sign and verify files or messages
  echo 'installing GNUpg'
  brew install gpg

  # MySQL database
  echo 'installing MySQL'
  brew install mysql

  # A code searching tool similar to ack, with a focus on speed.
  # echo 'installing the_silver_searcher'
  # brew install the_silver_searcher

fi
