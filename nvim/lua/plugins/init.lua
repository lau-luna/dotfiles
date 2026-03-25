return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- LSP Config (SOLO UNA VEZ)
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Mason para instalar LSP servers automáticamente
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "html-lsp",
        "css-lsp", 
        "haskell-language-server",
        "texlab",
        "clangd",
        "cpptools",
      },
    },
  },

  -- Treesitter para sintaxis
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "haskell",
        "latex",
        "c",
        "cpp"
      },
    },
  },
  
  -- Java LSP jdtls
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      require("custom.configs.jdtls")
    end,
  },

  -- Formateador para Haskell
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        haskell = { "fourmolu" },  -- Agregar esta línea
        html = { "prettier" },
        htmldjango = { "prettier" },
      },
    },
  },

  -- Plugin para mejor sintaxis de Haskell
  {
    'neovimhaskell/haskell-vim',
    ft = 'haskell',
  },


  -- Formateador para C++ 
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        haskell = { "fourmolu" },
        html = { "prettier" },
        htmldjango = { "prettier" },
        c = { "clang-format" },      -- Agregar esta línea
        cpp = { "clang-format" },    -- Agregar esta línea
      },
    },
  },

  -- Servidor live con vite
  {
    "aurum77/live-server.nvim",
    ft = {"html", "css", "javascript", "php"},
    run = function()
      require"live_server.util".install()
    end,
    config = function()
      require"live_server".setup({})
      vim.keymap.set('n', '<leader>ll', ':LiveServerStart<CR>', {noremap = true, silent = true})
      vim.keymap.set('n', '<leader>lq', ':LiveServerStop<CR>', {noremap = true, silent = true})
    end,
  },

  -- Vimtex para LaTeX (AGREGAR ESTE PLUGIN)
  {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      -- Configuración básica de vimtex
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_quickfix_mode = 0
      vim.g.tex_flavor = 'latex'
    end,
  },
}
