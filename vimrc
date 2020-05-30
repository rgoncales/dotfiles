syntax on

"preferences
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
set autoindent
set incsearch
set scrolloff=8
let g:netrw_banner = 0

"tab-sizes
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

"give more space for displaying messages.
set cmdheight=2
set updatetime=750

"set column
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

"display statusline
set laststatus=2
set title

"modding find
set path+=**
set wildmenu
"set wildmode=longest:full,full
set wildignore+=**/node_modules/**

set clipboard=unnamed

call plug#begin('~/.vim/plugins')
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

"CSS autocompletion
autocmd FileType css set omnifunc=csscomplete

"colorscheme onedark
colorscheme gruvbox

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

