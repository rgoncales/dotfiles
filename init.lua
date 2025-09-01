--=============== Basic Settings ===============
vim.opt.exrc = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("config") .. "/undodir"
vim.opt.undofile = true

vim.opt.wrap = false
vim.opt.errorbells = false
vim.opt.splitright = true
vim.opt.hidden = true
vim.opt.clipboard = "unnamedplus"

vim.opt.cmdheight = 2
vim.opt.updatetime = 50
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.laststatus = 2
vim.opt.title = true

vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 999
vim.opt.foldclose = "all"

--=============== Plugins ===============
require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "sheerun/vim-polyglot"
  use "gruvbox-community/gruvbox"
  use "NLKNguyen/papercolor-theme"
  use {"neoclide/coc.nvim", branch = "release"}
  use {"junegunn/fzf", run = function() vim.fn["fzf#install"]() end}
  use "junegunn/fzf.vim"
  use "jremmen/vim-ripgrep"
  use "preservim/nerdcommenter"
  use "mhinz/vim-grepper"
  use {"iamcco/markdown-preview.nvim", run = "cd app && npm install", ft = {"markdown"}}
end)

vim.cmd [[
  colorscheme gruvbox
  set background=dark
]]

vim.g.coc_global_extensions = {
  "coc-tsserver",
  "coc-prettier",
  "coc-pairs",
  "coc-eslint",
  "coc-json",
  "coc-css",
  "coc-pyright",
}

--=============== Keymaps ===============
vim.g.mapleader = " "
vim.g.netrw_banner = 0

-- Formatter
function FormatBuffer()
  if vim.bo.filetype == "python" then
    vim.cmd("%!black - -l79")
  else
    vim.cmd("CocCommand prettier.formatFile")
  end
end
vim.keymap.set("n", "<Leader>py", FormatBuffer)

-- Completion (tab navigation)
function _G.check_back_space()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

vim.api.nvim_set_keymap("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<S-TAB>", 'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"', {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<CR>", 'coc#pum#visible() ? coc#_select_confirm() : "<CR>"', {expr = true, silent = true})

-- FZF
vim.keymap.set("n", "<C-p>", ":GFiles<CR>")

-- Grepper
vim.g.grepper = {tools = {"rg"}}
vim.keymap.set("n", "<leader>g", ":Grepper -tool rg<CR>")
vim.keymap.set("n", "<leader>G", ":Grepper -tool rg -buffers<CR>")

-- NERDCommenter
vim.keymap.set("n", "<Leader>cl", "<plug>NERDCommenterToggle")
vim.keymap.set("v", "<Leader>cl", "<plug>NERDCommenterToggle")

-- Divider insert
vim.keymap.set("n", "<Leader>div", "o<CR>" .. string.rep("---- ", 15) .. "<CR>" .. string.rep("---- ", 15) .. "<CR><Esc>")

-- Window navigation
vim.keymap.set("n", "<C-k>", "<C-w>k", {silent = true})
vim.keymap.set("n", "<C-j>", "<C-w>j", {silent = true})
vim.keymap.set("n", "<C-h>", "<C-w>h", {silent = true})
vim.keymap.set("n", "<C-l>", "<C-w>l", {silent = true})

-- Coc navigation
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})

-- Copy current path
vim.keymap.set("n", "<leader>fp", ':let @+ = expand("%")<CR>')

