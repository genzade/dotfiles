" BASE SETTINGS

set nu                          " let's see what line I'm on in normal mode
set numberwidth=5
set colorcolumn=120             " ruler
set cursorcolumn                " highlight current column, works nicely with conoline plugin
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set foldcolumn=1

" open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" write vim's temporary files elsewhere to prevent frequent rebuild issues (ember was complaining)
" note that these files will have to be made as well so in terminal (cd ~ && mkdir ~/.vim/backup && mkdir ~/.vim/swp)
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
