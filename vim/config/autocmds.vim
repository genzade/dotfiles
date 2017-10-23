" AUTOCOMMANDS

augroup GENERAL
  autocmd!
  autocmd VimResized * wincmd =                     " automatically resize splits when host window is resized
  autocmd BufWritePre * %s/\s\+$//e                 " automatically remove trailing whitespaces on save (:w)
  au BufRead,BufNewFile *.md setlocal textwidth=120 spell
                                                    " markkdown settings
                                                    " textwidth and spell
                                                    " checking
  " autocmd BufWritePost $MYVIMRC source $MYVIMRC
  autocmd FileType nerdtree setlocal relativenumber " easier navigation for big file structures
augroup end
