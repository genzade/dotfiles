" ACKVIM SETTINGS

" leader 'a' 'stringToSearch' location to search and off you go!
nnoremap <Leader>a :Ack!<Space>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
