#!/bin/sh

cat << Output
------------------------------------------------------------------------
                                                     INSTALLATION-SCRIPT
------------------------------------------------------------------------



------------------------------------
                             install
------------------------------------
Output

if [[ "$(uname)" == "Darwin" ]]; then

  # fuzzy finder setup
cat << Output
------------------------------------
                      installing fzf
------------------------------------
Output

  brew install fzf

cat << Output
                                    ------------------------------------
                                    installing fzf fuzzy completion
                                    ------------------------------------
Output

  # To install useful key bindings and fuzzy completion:
  $(brew --prefix)/opt/fzf/install

  # asdf, the extendable version manager.
  # Supported languages include Ruby, Node.js, Elixir and more.
cat << Output
------------------------------------
                     installing asdf
------------------------------------
Output

  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.0
  echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
  echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc

  # tig: text-mode interface for Git
cat << Output
                                    ------------------------------------
                                    installing tig
                                    ------------------------------------
Output

  brew install tig

  # openssl: general purpose cryptographic library
cat << Output
------------------------------------
                  installing openssl
------------------------------------
Output

  brew install openssl

  # Programming language prerequisites and package managers
cat << Output
                                    ------------------------------------
                                    installing libyaml
                                    ------------------------------------
Output

  brew install libyaml # should come after openssl

  # basic file, shell and text manipulation utilities of the GNU operating system
cat << Output
------------------------------------
                installing coreutils
------------------------------------
Output

  brew install coreutils

  # yarn: a new package manager for javaScript
cat << Output
                                    ------------------------------------
                                    installing yarn
                                    ------------------------------------
Output

  brew install yarn

  # create, edit, compose, or convert bitmap images
cat << Output
------------------------------------
              installing ImageMagick
------------------------------------
Output

  brew install imagemagick

  # Use GPG Suite to encrypt, decrypt, sign and verify files or messages
cat << Output
                                    ------------------------------------
                                    installing GNUpg
                                    ------------------------------------
Output

  brew install gpg

  # MySQL database
cat << Output
------------------------------------
                    installing MySQL
------------------------------------
Output

  brew install mysql

  # A code searching tool.
cat << Output
                                    ------------------------------------
                                    installing ripgrep
                                    ------------------------------------
Output

  brew install ripgrep

  # colorscheme setup
cat << Output
------------------------------------
                              base16
------------------------------------
Output

  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

fi
