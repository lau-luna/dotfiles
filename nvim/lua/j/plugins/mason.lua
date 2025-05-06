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
                ensure_installed = { "jdtls", "lua_ls", "texlab" }, -- Asegúrate de que texlab esté aquí
                automatic_installation = true,
            })
        end,
    }
}
