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

   -- Configuración de texlab
        lspconfig.texlab.setup({
            settings = {
                texlab = {
                    build = {
                        executable = 'latexmk',
                        args = {'-pdf', '-interaction=nonstopmode', '-synctex=2', '%f'},
                        forwardSearchAfter = false,
                    },
                },
            },
        })
	end
}
