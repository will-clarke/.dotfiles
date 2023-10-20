return {
	"folke/which-key.nvim",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"tpope/vim-dispatch",
	"tpope/vim-unimpaired", -- ]q ]a ]f ]< > ]e ]n ]ow ]ol
	"folke/neodev.nvim",
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
	},
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup({ mapping = { "jk", "jj", "kj" } })
		end,
		event = "VeryLazy",
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			integrations = {
	-- 				harpoon = true,
	-- 			},
	-- 		})
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end,
	-- },
	-- {
	-- 	"ldelossa/gh.nvim",
	-- 	dependencies = { "ldelossa/litee.nvim" },
	-- 	config = function()
	-- 		require("litee.lib").setup()
	-- 		require("litee.gh").setup()
	-- 	end,
	-- },
	{
		"Wansmer/treesj",
		config = function()
			require("treesj").setup({ use_default_keymaps = false, max_join_length = 150 })
		end,
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
}
