return {
  -- Complemento para LSP
  {
    'neovim/nvim-lspconfig',  -- Soporte para LSP
    config = function()
      -- Configura el servidor LSP para texlab
      require'lspconfig'.texlab.setup{
        settings = {
          texlab = {
            build = {
              executable = 'latexmk',
              args = {'-pdf', '-interaction=nonstopmode', '-synctex=2', '%f'},
              forwardSearchAfter = false,
            },
          },
        },
      }
    end
  },

  -- Complemento para LaTeX (vimtex)
  {
    'lervag/vimtex',  -- URL correcta de vimtex
    config = function()
      -- Configura vimtex
      vim.g.vimtex_view_method = 'zathura'  -- Usa zathura como visor de PDF
      vim.g.vimtex_compiler_method = 'latexmk'  -- Usa latexmk para compilar
      vim.g.vimtex_quickfix_mode = 1  -- Desactiva el quickfix por defecto
    end
  },

  -- Complemento para el resaltado de sintaxis
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',  -- Asegúrate de que tienes los últimos árboles de sintaxis
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "latex" },  -- Asegúrate de que Latex esté incluido
        highlight = {
          enable = true,
          disable = {},  -- Desactiva para lenguajes específicos si es necesario
        },
      }
    end
  },

  -- Autocompletado con nvim-cmp
  {
    'hrsh8th/nvim-cmp',
    config = function()
      local cmp = require'cmp'
      cmp.setup {
        sources = {
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'buffer' },
        },
      }
    end
  },

  -- Complemento para completar LSP
  {
    'hrsh8th/cmp-nvim-lsp',
  }
}
