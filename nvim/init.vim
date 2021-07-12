set path+=**

call plug#begin()

Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'Raimondi/delimitMate'
Plug 'xavierd/clang_complete'

call plug#end()
