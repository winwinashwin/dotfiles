au BufEnter *.cpp set makeprg=g++\ -std=c++14\ -D_DEBUG\ %\ -o\ %< 
autocmd TermOpen * startinsert
au filetype cpp nnoremap <F9> :w <bar> :make <bar> :term ./%:r<CR>
au filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $
