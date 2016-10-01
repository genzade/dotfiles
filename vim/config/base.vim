" BASE SETTINGS

set nocompatible                " I WILL BE V-IMPROVED
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
