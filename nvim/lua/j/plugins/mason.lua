return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "jdtls", "lua_ls" }, -- Agrega aquí los servidores que quieras
                automatic_installation = true,
            })
        end,
    }
}
