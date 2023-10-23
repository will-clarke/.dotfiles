return {
	"gbprod/yanky.nvim",
	event = "VeryLazy",
	dependencies = { "kkharji/sqlite.lua" },
	config = function()
		require("yanky").setup({
			ring = {
				storage = "sqlite",
			},
		})
	end,
}
