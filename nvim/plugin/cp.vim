" brace autocomplete
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

au filetype cpp nnoremap <leader>rm :w <bar> !g++ -std=c++14 -DLOCAL -o %:r % <CR>
au filetype cpp nnoremap <leader>rr :vsp stdin.txt <CR>
au filetype cpp nnoremap <leader>rt :!./%:r <CR>
au filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $
