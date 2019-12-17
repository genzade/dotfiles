#!/bin/sh

echo 'installing vim'

if [[ "$(uname)" == "Darwin" ]]; then

cat << VimOutput
  vim installation (mac comes pre-installed with vim but it is compiled without clipboard)     |
  this step is not needed if you have a version of vim that has system clipboard functionality |
  you can check this by running 'vim --version | grep clipboard' in your terminal              |

  'vim --version | grep clipboard'
`vim --version | grep clipboard`

  if you see '+clipboard' then you're fine
  if you see '-clipboard' then run

  'brew update && brew install vim'
  '...everything will will install the first time you start vim'
VimOutput

  echo 'installing ctags'
  brew install --HEAD universal-ctags/universal-ctags/universal-ctags
  echo '. . . . . . . . . Done!'

  echo 'installing tmux'
  brew install tmux
  echo '. . . . . . . . . Done!'

  echo 'installing ripgrep'
  brew install ripgrep
  echo '. . . . . . . . . Done!'

  echo 'installing fzf'
  brew install fzf
  $(brew --prefix)/opt/fzf/install
  echo '. . . . . . . . . Done!'

  echo 'installing asdf'
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  cd ~/.asdf
  git checkout "$(git describe --abbrev=0 --tags)"
  cd $HOME
  echo '. . . . . . . . . Done!'

fi

echo 'installing terminal colours'
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
echo '. . . . . . . . . Done!'

ln -s $HOME/dotfiles/vim/vimrc .vimrc
ln -s $HOME/dotfiles/tmux/tmux.conf .tmux.conf
ln -s $HOME/dotfiles/ctags .ctags

echo 'changing default shell'
ln -s $HOME/dotfiles/zsh/vanilla-zshrc .zshrc
chsh -s /bin/zsh
echo '. . . . . . . . . Done!'
