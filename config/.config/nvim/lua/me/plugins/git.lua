return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"sindrets/diffview.nvim",
		"f-person/git-blame.nvim",
	},
	config = function()
		require("neogit").setup()
		require("gitblame").setup()
	end,
	event = "VeryLazy",
}
