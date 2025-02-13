return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers", -- Muestra buffers como pestañas
                separator_style = "slant", -- Estilo de separador
                diagnostics = "nvim_lsp", -- Muestra errores del LSP
                show_buffer_close_icons = true, -- Habilita iconos de cerrar
                show_close_icon = true, -- Habilita el icono de cerrar en la barra
                close_command = "bdelete! %d", -- Comando para cerrar buffer
                right_mouse_command = "bdelete! %d", -- Click derecho para cerrar
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "left"
                    }
                }
            }
        })
    end
}
