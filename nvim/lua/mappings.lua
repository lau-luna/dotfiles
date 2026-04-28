require "nvchad.mappings"

local map = vim.keymap.set

-- ============= GENERAL =============
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- ============= BUFFER MANAGEMENT =============
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
map("n", "<leader>x", "<cmd>bd<CR>, { desc = "Cerrar buffer" })
map("n", "<leader>X", "<cmd>bd!<CR>", { desc = "Cerrar buffer (forzado)" })

-- ============= WINDOW NAVIGATION =============
map("n", "<C-h>", "<C-w>h", { desc = "Mover a la izquierda" })
map("n", "<C-l>", "<C-w>l", { desc = "Mover a la derecha" })
map("n", "<C-j>", "<C-w>j", { desc = "Mover abajo" })
map("n", "<C-k>", "<C-w>k", { desc = "Mover arriba" })

-- ============= WINDOW RESIZE =============
map("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Reducir altura" })
map("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Aumentar altura" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Reducir ancho" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Aumentar ancho" })

-- ============= LSP & FORMAT =============
map("n", "<F12>", function() vim.lsp.buf.format({ async = true }) end, { desc = "Formatear archivo" })
map("n", "<leader>fL", "<cmd>LspStop<cr><cmd>LspStart<cr>", { desc = "Reiniciar LSP" })

-- ============= UTILITIES =============
map("n", "<leader>rn", function() vim.wo.relativenumber = not vim.wo.relativenumber end, { desc = "Toggle relative number" })
map("n", "<leader>jv", function() local file = vim.fn.expand("%:p") vim.cmd("botright 15split | terminal openjml -esc " .. file) end, { desc = "OpenJML: verificar archivo" })

-- ============= LATEX =============
map("n", "<leader>lc", "<cmd>VimtexCompile<cr>", { desc = "Compilar LaTeX" })
map("n", "<leader>lC", "<cmd>VimtexCompileContinuous<cr>", { desc = "Compilación continua LaTeX" })
map("n", "<leader>lv", "<cmd>VimtexView<cr>", { desc = "Ver PDF en Zathura" })
map("n", "<leader>lt", "<cmd>VimtexStop<cr>", { desc = "Detener compilación" })
map("n", "<leader>le", "<cmd>VimtexErrors<cr>", { desc = "Mostrar errores de LaTeX" })
map("n", "<leader>lx", "<cmd>VimtexClean<cr>", { desc = "Limpiar archivos auxiliares" })

-- ============= MARKDOWN =============
map("n", "<leader>md", ":RenderMarkdown toggle<CR>", { desc = "Toggle Markdown Render" })
map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Markdown Preview Toggle" })
map("n", "<leader>mt", function() vim.cmd("w") vim.cmd("!txc -f % | glow") end, { desc = "Markdown to terminal" })

-- ============= LIVE SERVER (HTML) =============
map("n", "<leader>ls", ":LiveServerStart<CR>", { noremap = true, silent = true, desc = "Live Server Start" })
map("n", "<leader>lq", ":LiveServerStop<CR>", { noremap = true, silent = true, desc = "Live Server Stop" })