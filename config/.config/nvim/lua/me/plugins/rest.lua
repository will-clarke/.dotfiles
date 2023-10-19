local rest_ok, rest = pcall(require, "rest-nvim")
if not rest_ok then
	vim.notify("RestNvim not loaded", 3)
	return
end
return {
	"rest-nvim/rest.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	ft = { "http" },
	config = function()
		require("rest-nvim").setup({})

		local mappings = {
			n = {
				["<leader>r"] = { rest.run, "Execute" },
				["<leader>l"] = { rest.last, "last" },
			},
		}

		require("me.core.utils").map_keys(mappings)
	end,
}
