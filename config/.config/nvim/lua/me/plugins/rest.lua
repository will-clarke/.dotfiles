return {
	"rest-nvim/rest.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	ft = { "http" },
	config = function()
		local rest_ok, rest = pcall(require, "rest-nvim")
		if not rest_ok then
			vim.notify("RestNvim not loaded", 3)
			return
		end

		rest.setup({})
	end,
}
