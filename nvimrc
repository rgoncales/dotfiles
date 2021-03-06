"=============== Basic Sets ===============
set exrc

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

set cul
set guicursor=
set number
set relativenumber
set scrolloff=8

set hls
set ignorecase
set smartcase
set incsearch

set nobackup
set undodir=~/.vim/undodir
set undofile

set nowrap
set noerrorbells
set splitright
set hidden
set clipboard=unnamed

" give more space for displaying messages.
set cmdheight=2

" longer updatetimes show noticeable lag 
set updatetime=50

" set columns
set signcolumn=yes
set colorcolumn=80

" display statusline
set laststatus=2
set title

"=============== Plugins ===============

call plug#begin('~/.config/nvim/plugged')
  Plug 'sheerun/vim-polyglot'
  Plug 'gruvbox-community/gruvbox'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'jremmen/vim-ripgrep'
  Plug 'preservim/nerdcommenter'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none ctermbg=none

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-pairs',
  \ 'coc-eslint',
  \ 'coc-json',
  \ ]
 
"=============== Remaps ===============

let g:netrw_banner = 0
let mapleader = " "

""remap for line movement
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>==

" use py to run prettier
nmap <Leader>py :CocCommand prettier.formatFile<CR>

" move through autocomplete suggestions
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

"fzf file explorer
nnoremap <C-p> :GFiles<CR>

"for ripgrep
if executable('rg')
  let g:rg_derive_root='true'
endif  

" comment/uncomment out 
nnoremap <Leader>cl <plug>NERDCommenterToggle
vnoremap <Leader>cl <plug>NERDCommenterToggle

" ctrl-[hjkl] to select active split
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-l> <C-w>l
