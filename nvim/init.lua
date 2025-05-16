-- justo al inicio del archivo, antes de cargar plugins:
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_view_general_viewer = '/usr/bin/zathura'
vim.g.vimtex_view_general_options = '--fork --synctex-forward @line:@col:@tex @pdf'

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
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4    -- Hace que la tecla "Tab" inserte 4 espacios
vim.opt.expandtab = true   -- Usa espacios en lugar de tabs
vim.opt.autoindent = true  -- Mantiene la indentación de la línea anterior
vim.opt.smartindent = true -- Indenta automáticamente según el contexto

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

-- Mapea <Leader>v para guardar y compilar LaTeX
vim.api.nvim_set_keymap('n', '<Leader>v', ':w<CR>:VimtexCompile<CR>', { noremap = true, silent = true })

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

-- Formatear el archivo actual con LSP
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true, desc = "Format current buffer" })

-- Desactivar Tree-sitter para LaTeX
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"latex"},
  highlight = {
    enable = false, -- Desactiva el resaltado de sintaxis con Tree-sitter
  },
}

-- Configuración de texlab para que use latexindent para el formateo
require'lspconfig'.texlab.setup {
  settings = {
    texlab = {
      latexFormatter = "latexindent", -- Asegúrate de usar latexindent como formateador
      latexindent = {
        modifyLineBreaks = false, -- Ajusta según tus preferencias
      },
      -- Otras configuraciones de texlab que puedas necesitar
    },
  },
}
