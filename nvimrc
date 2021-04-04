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
  Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none ctermbg=none

"=============== Remaps ===============

let g:netrw_banner = 0
let mapleader = " "

"remap for line movement
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==


