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

-- cerrar buffer
map("n", "<leader>x", "<cmd>bd<CR>", { desc = "Cerrar buffer" })

-- cerrar buffer forzado
map("n", "<leader>X", "<cmd>bd!<CR>", { desc = "Cerrar buffer (forzado)" })

map("n", "<C-h>", "<C-w>h", { desc = "Mover a la izquierda" })
map("n", "<C-l>", "<C-w>l", { desc = "Mover a la derecha" })
map("n", "<C-j>", "<C-w>j", { desc = "Mover abajo" })
map("n", "<C-k>", "<C-w>k", { desc = "Mover arriba" })

map("n", "<C-Up>", "<cmd>resize -2<CR>")
map("n", "<C-Down>", "<cmd>resize +2<CR>")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- O usar F12 como acceso rápido
map("n", "<F12>", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Formatear archivo" })

-- Formatear con LSP específico
map("n", "<leader>fL", "<cmd>LspStop<cr><cmd>LspStart<cr>", { desc = "Reiniciar LSP" })


map("n", "<leader>rn", function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Toggle relative number" })

vim.keymap.set("n", "<leader>jv", function()
  local file = vim.fn.expand("%:p")
  vim.cmd("botright 15split | terminal openjml -esc " .. file)
end, { desc = "OpenJML: verificar archivo" })


local keymap = vim.keymap.set

vim.keymap.set("n", "<leader>md", ":RenderMarkdown toggle<CR>", { desc = "Toggle Markdown Render" })

vim.keymap.set("n", "<leader>mt", function()
  vim.cmd("w")
  vim.cmd("!txc -f % | glow")
end)

vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", {
  desc = "Markdown Preview"
})
