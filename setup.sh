#!/bin/sh

if [[ "$(uname)" == "Darwin" ]]; then
  # vim installation (mac comes pre-installed with vim but it is compiled without clipboard)
  # this step is not needed if you have a version of vim that has system clipboard functionality
  # you can check this by running 'vim --version | grep clipboard' in your terminal

  echo 'checking/setting up vim (see notes in script)'
  [[ $(vim --version | grep clipboard) == *"-clipboard"* ]] && brew update && brew install vim
  ln -s ~/dotfiles/vim/vimrc ~/.vimrc
  echo '...everything will will install the first time you start vim'
  echo '. . . . . . . . . Done!'

  echo 'installing ctags'
  brew install --HEAD universal-ctags/universal-ctags/universal-ctags
  ln -s ~/dotfiles/ctags ~/.ctags
  echo '. . . . . . . . . Done!'

  echo 'installing tmux, ripgrep and fzf'
  brew install tmuxinator tmux ripgrep fzf
  $(brew --prefix)/opt/fzf/install
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
  echo '. . . . . . . . . Done!'

  echo 'installing asdf'
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  cd ~/.asdf; git checkout "$(git describe --abbrev=0 --tags)"
  echo '. . . . . . . . . Done!'

  echo 'installing more brews; openssl, libyaml and coreutils'
  brew install openssl
  brew install libyaml # should come after openssl
  brew install coreutils
  echo '. . . . . . . . . Done!'
fi

echo 'installing terminal colours'
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
echo '. . . . . . . . . Done!'

echo 'changing default shell to zsh'
[[ $SHELL != *"zsh" ]] && chsh -s /bin/zsh
ln -s ~/dotfiles/zsh/vanilla-zshrc ~/.zshrc
echo '. . . . . . . . . Done!'

while true
do
  read -r -p "Setup using Kitty (see https://sw.kovidgoyal.net/kitty/conf.html)? [Y/n]" input

  case $input in
    [yY][eE][sS]|[yY])

  echo 'kitty setup'
  ln -sf ~/dotfiles/config/kitty ~/.config/

  break
  ;;

    [nN][oO]|[nN])
  echo "Kitty not setup"
  break
  ;;
      *)
  echo "Invalid input..."
  ;;
  esac
done

echo '. . . . . . . . . Done!'
