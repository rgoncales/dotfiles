syntax on

"tab-sizes
filetype plugin indent on
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab

set splitright
set hls
set ignorecase
set cul
set number
set relativenumber
set nowrap
set smartcase
set nobackup
set undodir=~/.vim/undodir
set undofile
set smartindent
set incsearch
set scrolloff=8

"give more space for displaying messages.
set cmdheight=2
set updatetime=750

"set column
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

"display statusline
set laststatus=2
set title

set clipboard=unnamed

call plug#begin('~/.vim/plugins')
Plug 'sheerun/vim-polyglot'
Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'
Plug 'prettier/vim-prettier'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
  let g:rg_derive_root='true'
endif  

let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

"CSS autocompletion
autocmd FileType css set omnifunc=csscomplete


"coc plugin
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

"fzf file explorer
nnoremap <C-p> :GFiles<CR>

"remap for line movement
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"remap Esc
inoremap jjj <Esc>
inoremap lll <Esc>
inoremap hhh <Esc>
inoremap kkk <Esc>

