#!/bin/sh

echo 'install vim'

if [[ "$(uname)" == "Darwin" ]]; then

cat << Output
  vim installation (mac comes pre-installed with vim but it is compiled without clipboard)
  this step is not needed if you have a version of vim that has system clipboard functionality
  you can check this by running 'vim --version | grep clipboard' in your terminal

	'vim --version | grep clipboard'
`vim --version | grep clipboard`

    if you see '+clipboard' then you're fine
    if you see '-clipboard' then run

'brew update && brew install vim'
Output

  ln -s $HOME/dotfiles/vim/vimrc .vimrc

  echo '...everything will will install the first time you start vim'
fi
