return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        opts = {
            auto_install = true,
        },
        config = true,
    },

    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets'
        },
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()

            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                formatting = lsp_zero.cmp_format({ details = true }),
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
                mapping = cmp.mapping.preset.insert({
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                }),
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
            })
        end
    },

    -- LSP Configuration
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'html',     -- HTML LSP
                    'cssls',    -- CSS LSP
                    'emmet_ls', -- Emmet Language Server
                    'jdtls'     -- Java Language Server
                },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,

                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,

                    emmet_ls = function()
                        require('lspconfig').emmet_ls.setup({
                            filetypes = { "html", "css", "javascriptreact", "typescriptreact", "svelte" },
                            init_options = {
                                html = {
                                    options = {
                                        ["bem.enabled"] = true
                                    }
                                }
                            }
                        })
                    end,

                    jdtls = function()
                        require('lspconfig').jdtls.setup({
                            cmd = { "jdtls" }, -- Asegúrate de tener jdtls instalado
                            root_dir = require('lspconfig.util').root_pattern("pom.xml", "gradle.build", ".git"),
                        })
                    end,
                }
            })

            -- Formateo automático antes de guardar
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*",
                callback = function()
                    local buf = vim.api.nvim_get_current_buf()
                    local clients = vim.lsp.get_active_clients({ bufnr = buf })

                    for _, client in ipairs(clients) do
                        if client.supports_method("textDocument/formatting") then
                            vim.lsp.buf.format({ async = false })
                            return
                        end
                    end
                end,
            })
        end
    }
}
