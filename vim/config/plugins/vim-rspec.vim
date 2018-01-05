" RSpec.vim mappings

" use spring to run rspec
let g:rspec_command = "!clear && rspec {spec}"
let g:rspec_runner = "os_x_iterm"

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>A :call RunAllSpecs()<CR>
