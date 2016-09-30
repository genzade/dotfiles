" VIM-AIRLINE

" airline theme
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1
" uncomment the following lines if you do not have patched fonts, I happen to
" have patched fonts already but if you want a fall back...
"
" ---FROM BELOW THIS LINE---
"let g:airline_powerline_fonts = 1

"if !exists('g:airline_symbols')
  "let g:airline_symbols = {}
"endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

""" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''"
" ---TO ABOVE THIS LINE---

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set termencoding=utf-8
set t_Co=256
set term=xterm-256color
set laststatus=2
