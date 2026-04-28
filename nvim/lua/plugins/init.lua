return {

  -- ========================
  -- 🧼 FORMATTER (UNO SOLO)
  -- ========================
  {
    "stevearc/conform.nvim",
    opts = require("configs.conform"),
  },

  -- ========================
  -- 🧠 LSP
  -- ========================
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },

  -- ========================
  -- 📦 Mason (LSP installer)
  -- ========================
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "html-lsp",
        "css-lsp",
        "haskell-language-server",
        "texlab",
        "clangd",
        "ltex-ls",
        "typescript-language-server",
        "eslint-lsp",
      },
    },
  },

  -- ========================
  -- 🌳 Treesitter
  -- ========================
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "haskell",
        "latex", "c", "cpp",
        "markdown", "markdown_inline", "yaml",
        "javascript"
      },
      highlight = {
        enable = true,
        disable = { "markdown" },
      },
    },
  },

  -- ========================
  -- ⚡ Emmet (HTML rápido)
  -- ========================
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascriptreact" },
  },

  -- ========================
  -- 🔒 Auto cerrar tags HTML
  -- ========================
  {
    "windwp/nvim-ts-autotag",
    ft = { "html" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- ========================
  -- 🧪 Lint + Grammar
  -- ========================
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- HTML lint
          -- null_ls.builtins.diagnostics.htmlhint,

          -- Grammar check (English)
          null_ls.builtins.diagnostics.languagetool.with({
            extra_args = { "--language", "en-US" },
          }),
        },
      })
    end,
  },

  -- ========================
  -- ☕ Java (jdtls)
  -- ========================
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      require("custom.configs.jdtls")
    end,
  },

  -- ========================
  -- 🐫 Haskell syntax
  -- ========================
  {
    "neovimhaskell/haskell-vim",
    ft = "haskell",
  },

  -- ========================
  -- 🧪 Live Server
  -- ========================
  {
    "aurum77/live-server.nvim",
    ft = { "html", "css", "javascript", "php" },
    run = function()
      require("live_server.util").install()
    end,
    config = function()
      require("live_server").setup({})
    end,
  },

  -- ========================
  -- 📄 LaTeX
  -- ========================
  {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_quickfix_mode = 0
      vim.g.tex_flavor = 'latex'
    end,
  },

}