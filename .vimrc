"line numbers
set number

"display statusline
set laststatus=2
set title
"search recursively
set path+=**

"allow tab-complete
set wildmenu
set wildmode=longest:full,full

"tab-sizes
set tabstop=4
set shiftwidth=4
set expandtab

"----- Plugins START
call plug#begin('~/.vim/plugins')

"vim-polyglot; fetches https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

call plug#end()
"----- Plugins END
