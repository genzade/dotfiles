" MAPPINGS

let mapleader="\<Space>"                 " I use space as my leader key

" Files
nnoremap <Leader>w ma:w<CR>`a            " Write
" ma:w^M`a
nnoremap <Leader>q :q<CR>                " Quit

" Tabs: open a new/specified file in a new tab eg. tn <CR> to open a no
" name buffer or tn name_that_buffer<CR> to open a named buffer
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>          " Next tab
nnoremap tj :tabprev<CR>          " Previous tab
nnoremap th :tabfirst<CR>         " First tab
nnoremap tl :tablast<CR>          " Last tab

nnoremap <Leader>v :source $MYVIMRC<CR>
" vmap Y "*y

" nnoremap <C-q>q :%s/'\(\([^']*\)\)'/"\1"/g <CR>          " Change all single quotes to double
" nnoremap <C-q>  :%s/"\(\([^"]*\)\)"/'\1'/g <CR>          " Change all double quotes to single

" :%s/'\(\([^']*\)\)'/"\1"/g
" :%s/"\(\([^"]*\)\)"/'\1'/g
" Search and replace text with '/' text then 'cs' to change the text, 'n' for
" next instance of text, '.' to repeat
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
  \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>
