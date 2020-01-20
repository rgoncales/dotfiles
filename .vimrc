"preferences
set number
set splitright
set hls

"display statusline
set laststatus=2
set title
"search recursively
set path+=**

"allow tab-complete
set wildmenu
set wildmode=longest:full,full

"tab-sizes
set tabstop=2
set shiftwidth=2
set expandtab

"----- Plugins START
call plug#begin('~/.vim/plugins')

"vim-polyglot; fetches https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

call plug#end()
"----- Plugins END

"remap for line movement
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
