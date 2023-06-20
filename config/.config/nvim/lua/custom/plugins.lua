local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},
	{
		"gbprod/yanky.nvim",
		keys = {
			{ "p", "<Plug>(YankyPutAfter)", { mode = { "x", "n" } } },
			{ "gp", "<Plug>(YankyGPutAfter)", { mode = { "x", "n" } } },
			{ "P", "<Plug>(YankyPutBefore)", { mode = { "x", "n" } } },
			{ "gP", "<Plug>(YankyGPutBefore)", { mode = { "x", "n" } } },
			{ "<C-p>", "<Plug>(YankyCycleForward)", { mode = { "x", "n" } } },
			{ "<C-n>", "<Plug>(YankyCycleBackward)", { mode = { "x", "n" } } },
		},
		config = function()
			require("yanky").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		lazy = false,
	},
	{
		"tpope/vim-fugitive",
		cmd = "Git",
	},
	{
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
		keys = {
			{ "<leader>la", ":CodeActionMenu<CR>" },
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		opts = {},
	},
	{
		"Wansmer/treesj",
		keys = { { "<leader>m", ":TSJToggle<cr>", desc = "Join Toggle" } },
		config = function()
			require("treesj").setup({ use_default_keymaps = false, max_join_length = 150 })
		end,
	},
	{
		"monaqa/dial.nvim",
		keys = { "<C-a>", { "<C-x>", mode = "n" } },
	},
	-- {
	-- 	"folke/trouble.nvim",
	-- 	event = "VeryLazy",
	-- 	requires = "nvim-tree/nvim-web-devicons",
	-- 	config = function()
	-- 		require("trouble").setup({})
	-- 	end,
	-- },
	{
		"gaoDean/autolist.nvim",
		ft = {
			"markdown",
			"text",
			"tex",
			"plaintex",
		},
		event = "VeryLazy",
		config = function()
			local autolist = require("autolist")
			autolist.setup()
			autolist.create_mapping_hook("i", "<CR>", autolist.new)
			autolist.create_mapping_hook("i", "<Tab>", autolist.indent)
			autolist.create_mapping_hook("i", "<S-Tab>", autolist.indent, "<C-D>")
			autolist.create_mapping_hook("n", "o", autolist.new)
			autolist.create_mapping_hook("n", "O", autolist.new_before)
			autolist.create_mapping_hook("n", ">>", autolist.indent)
			autolist.create_mapping_hook("n", "<<", autolist.indent)
			autolist.create_mapping_hook("n", "<C-r>", autolist.force_recalculate)
			autolist.create_mapping_hook("n", "<leader>x", autolist.invert_entry, "")
		end,
	},
	{
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
		cmd = "Octo",
	},
	{
		"linty-org/readline.nvim",
		event = "InsertEnter",
		config = function()
			local readline = require("readline")
			vim.keymap.set("!", "<M-f>", readline.forward_word)
			vim.keymap.set("!", "<M-b>", readline.backward_word)
			vim.keymap.set("!", "<C-a>", readline.beginning_of_line)
			vim.keymap.set("!", "<C-e>", readline.end_of_line)
			vim.keymap.set("!", "<M-d>", readline.kill_word)
			vim.keymap.set("!", "<M-BS>", readline.backward_kill_word)
			vim.keymap.set("!", "<C-w>", readline.unix_word_rubout)
			vim.keymap.set("!", "<C-k>", readline.kill_line)
			vim.keymap.set("!", "<C-u>", readline.backward_kill_line)
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		config = true,
		lazy = false,
		cmd = {
			"GitConflictChooseOurs",
			"GitConflictChooseTheirs",
			"GitConflictChooseBoth",
			"GitConflictChooseNone",
			"GitConflictNextConflict",
			"GitConflictPrevConflict",
			"GitConflictListQf",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "InsertEnter",
	},
	{
		"stevearc/oil.nvim",
		opts = {

			default_file_explorer = true,
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["gv"] = "actions.select_vsplit",
				["<C-s>"] = false,
				["gs"] = "actions.select_split",
				["gt"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["q"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["g."] = "actions.toggle_hidden",
			},
		},
		keys = { { ";", ":lua require('oil').open()<CR>" } },
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"knsh14/vim-github-link",
		keys = { { "<leader>gl", "<CMD>GetCommitLink<CR>" } },
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = overrides.telescope,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,

		-- dependencies = {},
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }

	-- To use a extras plugin
	{ import = "custom.configs.extras.copilot" },
	{ import = "custom.configs.extras.diffview" },
	{ import = "custom.configs.extras.mason-extras" },
	{ import = "custom.configs.extras.symbols-outline" },
	{ import = "custom.configs.extras.trouble" },
}

return plugins
