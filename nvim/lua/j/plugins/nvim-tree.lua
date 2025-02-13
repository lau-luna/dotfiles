return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		-- Deshabilitar netrw para evitar conflictos
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- Habilitar colores de 24 bits
		vim.opt.termguicolors = true

		-- Configuración de nvim-tree
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
				icons = {
					show = {
						git = true,
						file = true,  -- Mostrar íconos de archivos
						folder = true,  -- Mostrar íconos de carpetas
						folder_arrow = true,
					},
					glyphs = {
						default = "", -- Ícono por defecto para archivos
						symlink = "",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "⊖",
							ignored = "◌",
						},
					},
				},
			},
			filters = {
				dotfiles = true, -- Ocultar archivos ocultos
			},
		})
	end
}
