" BASE SETTINGS

set nocompatible                " I WILL BE V-IMPROVED
set nu                          " let's see what line I'm on in normal mode
set colorcolumn=120             " ruler
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set background=dark
set foldcolumn=1

" highlight repeat occurences of charecter or value above cursor
nnoremap , :mat Error "<C-R><C-W>"<CR>

" open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright
