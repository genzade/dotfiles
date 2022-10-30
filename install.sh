#!/usr/bin/env bash

set -e

DOTFILES_ROOT="$HOME/dotfiles"

setup_homebrew() {
  which brew \
    || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  brew update
  brew cleanup
  brew bundle install --file="$DOTFILES_ROOT/mac/Brewfile"
}

setup_karabiner() {
  KARABINER_CONFIG_DIR="$HOME/.config/karabiner"

  if [ -L "$KARABINER_CONFIG_DIR" ]; then
    if [ -d "$KARABINER_CONFIG_DIR" ]; then
      echo "symlink exists: NOT linking to $KARABINER_CONFIG_DIR"
      echo "symlink exists: NOT linking to $KARABINER_CONFIG_DIR"
    fi
  else
    ln -s "$DOTFILES_ROOT"/config/karabiner "$HOME"/.config
    echo "linked $DOTFILES_ROOT/config/karabiner to $KARABINER_CONFIG_DIR"
    launchctl kickstart -k gui/"$(id -u)"/org.pqrs.karabiner.karabiner_console_user_server
  fi
}

setup_git() {
  GITCONFIG=$HOME/.gitconfig
  GITIGNORE_GLOBAL=$HOME/.gitignore_global

  if ! [ -L "$GITCONFIG" ]; then
    echo "Creating symlink $GITCONFIG."
    ln -sf "$DOTFILES_ROOT"/git/gitconfig "$GITCONFIG"
  else
    echo "symlink exists: $GITCONFIG."
  fi

  if ! [ -L "$GITIGNORE_GLOBAL" ]; then
    echo "Creating symlink $GITIGNORE_GLOBAL."
    ln -sf "$DOTFILES_ROOT"/git/gitignore_global "$GITIGNORE_GLOBAL"
  else
    echo "symlink exists: $GITIGNORE_GLOBAL."
  fi
}

setup_zsh() {
  [[ $SHELL != *"zsh" ]] && chsh -s /bin/zsh

  ZSHRC=$HOME/.zshrc
  if ! [ -L "$ZSHRC" ]; then
    echo "Creating symlink $ZSHRC."
    ln -s "$DOTFILES_ROOT"/zsh/zshrc "$ZSHRC"
  else
    echo "symlink exists: $ZSHRC."
  fi
}

setup_alacritty() {
  # the app itself should have been installed with the Brewfile.
  # setup will make sure terminfo is installed and config is symlinked

  ALACRITTY_CONFIG_DIR=$HOME/.config/alacritty

  if [ ! -e "/Applications/Alacritty.app" ]; then
    ALACRITTY_CLONE=$HOME/alacritty

    if ! command -v cargo &> /dev/null ; then
      curl https://sh.rustup.rs -sSf | sh -s -- -y
      # shellcheck disable=1091
      source "$HOME/.cargo/env"
    fi

    git clone https://github.com/alacritty/alacritty.git "$ALACRITTY_CLONE"

    cd "$ALACRITTY_CLONE"

    "$HOME"/.cargo/bin/rustup override set stable
    "$HOME"/.cargo/bin/rustup update stable
    "$HOME"/.cargo/bin/cargo build --release

    make app

    cp -r target/release/osx/Alacritty.app /Applications/

    if ! (toe | grep -q alacritty); then
      echo "terminfo not installed"

      sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
    else
      echo "alacritty terminfo already added"
    fi

    cd ..
    rm -rf "$ALACRITTY_CLONE"
  fi

  if [ -L "$ALACRITTY_CONFIG_DIR" ]; then
    if [ -d "$ALACRITTY_CONFIG_DIR" ]; then
      echo  "symlink exists: NOT linking to $ALACRITTY_CONFIG_DIR"
    fi
  else
    ln -s "$DOTFILES_ROOT"/config/alacritty "$ALACRITTY_CONFIG_DIR"
    echo "linked $DOTFILES_ROOT/config/alacritty to $ALACRITTY_CONFIG_DIR"
  fi

  if ! [ -d "${ZDOTDIR:-~}"/.zsh_functions ]; then
    echo "${ZDOTDIR:-~}/.zsh_functions does not exist, creating now"
    mkdir -p "${ZDOTDIR:-~}"/.zsh_functions
  fi
}

setup_fzf() {
  # should be installed already, see Brewfile
  if [ -f '/usr/local/opt/fzf/install' ]; then
    echo "finish setting up fzf for zsh"

    /usr/local/opt/fzf/install \
      --all \
      --no-update-rc \
      --completion \
      --key-bindings \
      --no-fish \
      --no-bash
  else
    echo "WARNING: fzf install command not found. Skipping."
  fi
}

setup_asdf() {
  ASDF_DIR=$HOME/.asdf
  if ! [ -d "$ASDF_DIR" ]; then
    # will use git to install asdf instead of homebrew
    # see https://github.com/asdf-vm/asdf/issues/785
    echo "installing asdf plugin manager in $ASDF_DIR"

    git clone https://github.com/asdf-vm/asdf.git "$ASDF_DIR"
    cd "$ASDF_DIR"
    git checkout "$(git describe --abbrev=0 --tags)"

    cd ..
  else
    echo "asdf already installed"
  fi

  GLOBAL_TOOL_VERSIONS="$HOME"/.tool-versions

  if ! [ -L "$GLOBAL_TOOL_VERSIONS" ]; then
    echo "Creating symlink $GLOBAL_TOOL_VERSIONS."
    ln -sf "$DOTFILES_ROOT"/asdf/tool-versions "$GLOBAL_TOOL_VERSIONS"
  else
    echo "symlink exists: $GLOBAL_TOOL_VERSIONS."
  fi

  if [ -f "$HOME"/.tool-versions ]; then
    while IFS=' ' read -ra tools; do
      PLUGIN=${tools[0]}
      VERSION=${tools[1]}

      if  ! asdf plugin-list | grep -q "$PLUGIN"; then
        echo     "plugin $PLUGIN does not exist, installing now..."

        asdf     plugin-add "$PLUGIN"
        asdf     plugin update "$PLUGIN"
        asdf     install "$PLUGIN" "$VERSION"
      else
        echo     "plugin $PLUGIN already setup"
      fi
    done < "$HOME"/.tool-versions
  fi
}

setup_base16() {
  BASE16_PATH="$HOME"/.config/base16-shell

  if ! [ -d "$BASE16_PATH" ]; then
    git clone https://github.com/chriskempson/base16-shell.git "$BASE16_PATH"
  else
    echo "already installed"
  fi
}

setup_neovim() {
  NEOVIM_PATH="$HOME/.config/nvim"

  if [ -L "$NEOVIM_PATH" ]; then
    if [ -d "$NEOVIM_PATH" ]; then
      echo  "symlink exists: NOT linking to $NEOVIM_PATH"
    fi
  else
    ln -s "$DOTFILES_ROOT"/config/nvim "$HOME"/.config
    echo "linked $DOTFILES_ROOT/config/neovim to $NEOVIM_PATH"
  fi
}

setup_tmux() {
  TMUX_CONF=$HOME/.tmux.conf

  if ! [ -L "$TMUX_CONF" ]; then
    echo "Creating symlink $TMUX_CONF."
    ln -s "$DOTFILES_ROOT"/tmux/tmux.conf "$TMUX_CONF"
  else
    echo "symlink exists: $TMUX_CONF."
  fi
}


setup_osx() {
  if [ "$(uname -s)" == "Darwin" ]; then
    echo -e "\n\nRunning on OSX"

    "$DOTFILES_ROOT"/mac/osx-defaults.sh
  fi
}

setup_hammerspoon() {
  HAMMERSPOON_PATH="$HOME/.config/hammerspoon"

  if [ -L "$HAMMERSPOON_PATH" ]; then
    if [ -d "$HAMMERSPOON_PATH" ]; then
      echo  "symlink exists: NOT linking to $HAMMERSPOON_PATH"
    fi
  else
    ln -s "$DOTFILES_ROOT"/config/hammerspoon "$HOME"/.config
    echo "linked $DOTFILES_ROOT/config/hammerspoon to $HAMMERSPOON_PATH"
  fi
}

setup_homebrew
setup_karabiner
setup_git
setup_zsh
setup_alacritty
setup_fzf
setup_asdf
setup_base16
setup_neovim
setup_tmux
setup_hammerspoon
setup_osx
