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

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldclose = "all"

--=============== Plugins ===============
require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  use { "morhetz/gruvbox", as = "gruvbox" }

  -- Treesitter for syntax
  --USE FOR FIRST INSTALL, THEN SWITCH TO TSUpdate
  --use {
  --    'nvim-treesitter/nvim-treesitter',
  --    run = function()
  --        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
  --        ts_update()
  --    end,
  --}
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

  -- LSP + Autocompletion
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"

  -- Telescope (fzf replacement)
  use {"nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"}}

  -- Utilities
  use "preservim/nerdcommenter"
  use "mhinz/vim-grepper"
  use "jremmen/vim-ripgrep"
  use {"iamcco/markdown-preview.nvim", run = "cd app && npm install", ft = {"markdown"}}
end)

vim.g.gruvbox_contrast_light = "medium"
vim.cmd.colorscheme "gruvbox"
vim.o.background = "dark"

--=============== Keymaps ===============
vim.g.mapleader = " "
vim.g.netrw_banner = 0

-- Window navigation
vim.keymap.set("n", "<C-k>", "<C-w>k", {silent = true})
vim.keymap.set("n", "<C-j>", "<C-w>j", {silent = true})
vim.keymap.set("n", "<C-h>", "<C-w>h", {silent = true})
vim.keymap.set("n", "<C-l>", "<C-w>l", {silent = true})

-- Commenter
vim.keymap.set("n", "<Leader>cl", "<plug>NERDCommenterToggle")
vim.keymap.set("v", "<Leader>cl", "<plug>NERDCommenterToggle")

-- Telescope bindings
vim.keymap.set("n", "<C-p>", "<cmd>Telescope git_files<CR>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")

-- Copy current path
vim.keymap.set("n", "<leader>fp", ':let @+ = expand("%")<CR>')

--=============== Treesitter ===============
require("nvim-treesitter.configs").setup {
  highlight = { enable = true },
  indent = { enable = true },
}

--=============== Completion ===============
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<TAB>"] = cmp.mapping.select_next_item(),
    ["<S-TAB>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }),
})

--=============== LSP ===============
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "ts_ls", "jsonls", "cssls", "eslint" },
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = { "pyright", "ts_ls", "jsonls", "cssls", "eslint" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
  })
end

-- LSP keymaps
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {silent = true})
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, {silent = true})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {silent = true})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {silent = true})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {silent = true})

-- Format command
vim.keymap.set("n", "<Leader>py", function() vim.lsp.buf.format({async = true}) end)
