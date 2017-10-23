" RSpec.vim mappings

" use spring to run rspec
let g:rspec_command = "!clear && bundle exec rspec {spec}"

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>A :call RunAllSpecs()<CR>
