return {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup({
            ensure_installed = { "jdtls", "lua_ls" },
            automatic_installation = true,
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                if lspconfig[server_name] then
                    lspconfig[server_name].setup({})
                else
                    vim.notify("Mason-LSPConfig: Servidor desconocido " .. server_name, vim.log.levels.WARN)
                end
            end,
        })

        -- Configuración manual para TypeScript
        lspconfig.tsserver.setup({})
    end,
}
