-- Configuración general
vim.g.mapleader = ' '

-- Configurar Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("j.plugins")

-- Apariencia
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- Opciones generales de Neovim
vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Atajos de teclado
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Movimientos entre ventanas
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>n', ':NvimTreeFocus<CR>', opts)

-- Seleccionar todo
map('n', '<C-a>', 'ggVG', opts)

-- Bufferline
map('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)
map('n', '<leader>bd', ':bdelete<CR>', opts)



-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})

-- Treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "html", "javascript", "css" },
  highlight = { enable = true },
}
