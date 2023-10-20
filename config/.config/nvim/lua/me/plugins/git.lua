return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"sindrets/diffview.nvim",
		"f-person/git-blame.nvim",
		"lewis6991/gitsigns.nvim",
	},
	config = function()
		require("neogit").setup()
		require("gitblame").setup()
		require("gitsigns").setup()
	end,
	event = "VeryLazy",
}
