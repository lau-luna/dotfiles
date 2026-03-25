require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Mapeos para LaTeX con vimtex (CORREGIDOS)
map("n", "<leader>lc", "<cmd>VimtexCompile<cr>", { desc = "Compilar LaTeX" })
map("n", "<leader>lC", "<cmd>VimtexCompileContinuous<cr>", { desc = "Compilación continua LaTeX" })
map("n", "<leader>lv", "<cmd>VimtexView<cr>", { desc = "Ver PDF en Zathura" })
map("n", "<leader>ls", "<cmd>VimtexStop<cr>", { desc = "Detener compilación" })
map("n", "<leader>lclean", "<cmd>VimtexClean<cr>", { desc = "Limpiar archivos auxiliares" })
map("n", "<leader>ll", "<cmd>VimtexErrors<cr>", { desc = "Mostrar errores de LaTeX" })


map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })




-- O usar F12 como acceso rápido
map("n", "<F12>", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Formatear archivo" })

-- Formatear con LSP específico
map("n", "<leader>fL", "<cmd>LspStop<cr><cmd>LspStart<cr>", { desc = "Reiniciar LSP" })
