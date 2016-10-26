" MAPPINGS

let mapleader="\<Space>"                 " I use space as my leader key

" Files
nnoremap <Leader>w :w<CR>                " Write
nnoremap <Leader>q :q<CR>                " Quit

" Tabs: open a new/specified file in a new tab
nnoremap <Leader>n :tabnew<Space>
nnoremap <Leader>k :tabnext<CR>          " Next tab
nnoremap <Leader>j :tabprev<CR>          " Previous tab
nnoremap <Leader>h :tabfirst<CR>         " First tab
nnoremap <Leader>l :tablast<CR>          " Last tab

" Search and replace text with '/' text then 'cs' to change the text, 'n' for next instance of text, '.' to repeat
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
  \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>
