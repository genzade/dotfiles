" BASE16 SETTINGS

" colorscheme base16-default-dark
colorscheme base16-3024
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let base16colorspace=256
