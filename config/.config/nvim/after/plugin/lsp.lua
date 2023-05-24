-- do we really need this?
require('mason').setup()


local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	'gopls',
})

lsp.nvim_workspace()

lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)


lsp.configure('lua_ls', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})

lsp.setup()
