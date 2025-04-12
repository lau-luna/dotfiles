return {
	'neovim/nvim-lspconfig',
	config = function()
		local lspconfig = require('lspconfig')

		-- HTML
		lspconfig.html.setup {}

		-- PHP (opcional: elegí uno)
		-- Si tenés instalado Intelephense:
		lspconfig.intelephense.setup {}

		-- O si preferís usar phpactor:
		-- lspconfig.phpactor.setup {}
	end
}
