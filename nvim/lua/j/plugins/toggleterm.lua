return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup {
            size = 15, -- Altura de la terminal flotante
            open_mapping = [[<A-t>]], -- Ahora usa Alt+L para abrir/cerrar
            shade_terminals = true,
            direction = "horizontal", -- Puede ser "vertical", "horizontal", "tab" o "float"
            float_opts = {
                border = "curved",
            }
        }
    end
}
