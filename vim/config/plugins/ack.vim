" ACKVIM SETTINGS

nnoremap <Leader>a :Ack!<Space>               " leader 'a' 'stringToSearch' location to search and off you go!

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
