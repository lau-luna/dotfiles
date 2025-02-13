
require('lazy').setup({
    -- Plugin para el árbol de archivos
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('nvim-tree').setup()
        end
    },

    -- Plugin de Blink para autocompletado con fuzzy matching
    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        version = '*',
        opts = {
            keymap = {
                -- Usa 'ctrl-k' para abrir el autocompletado y 'ctrl-f' para confirmar selección
                custom = {
                    ["<C-k>"] = "next_item",  -- Navegar hacia abajo en la lista
                    ["<C-S-k>"] = "prev_item", -- Navegar hacia arriba
                    ["<C-f>"] = "confirm"  -- Confirmar la selección
                }
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' }
            },
        },
        opts_extend = { "sources.default" }
    },

    -- Configuración de LSP con Blink
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },
        opts = {
            servers = {
                lua_ls = {}
            }
        },
        config = function(_, opts)
            local lspconfig = require('lspconfig')
            for server, config in pairs(opts.servers) do
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end
        end
    }
})
