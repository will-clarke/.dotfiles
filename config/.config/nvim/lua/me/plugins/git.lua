return {
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	-- {
	-- 	"fredeeb/tardis.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	config = true,
	-- 	cmd = "Tardis",
	-- },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"sindrets/diffview.nvim",
			"f-person/git-blame.nvim",
			"lewis6991/gitsigns.nvim",
		},
		config = function()
			require("neogit").setup({})
			require("gitblame").setup({})
			require("gitsigns").setup({})
		end,
		event = "VeryLazy",
	},
	{
		-- note this plugin only operates when the git repo is in a conflict state..
		-- just git add won't work
		"akinsho/git-conflict.nvim",
		version = "*",
		opts = {},
		event = "VeryLazy",
	},
}
