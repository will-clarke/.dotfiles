local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
	{
		"echasnovski/mini.align",
		version = "*",
		config = function()
			require("mini.align").setup({
				mappings = {
					start = "gA",
				},
			})
		end,
		keys = { "ga", "gA" },
	},
	{
		"knubie/vim-kitty-navigator",
		event = "VeryLazy",
	},
	{
		"Vigemus/iron.nvim",
		keys = {
			{ "<leader>sr", "<cmd>IronRepl<cr>", { mode = "n", desc = "repl" } },
			{ "<leader>sf", "<cmd>IronFocus<cr>" },
			{ "<leader>sR", "<cmd>IronRestart<cr>" },
			{ "<leader>sh", "<cmd>IronHide<cr>" },
		},
		config = function()
			local view = require("iron.view")
			require("iron.core").setup({
				config = {
					repl_open_cmd = view.split.vertical("40%"),
				},
				keymaps = {
					send_motion = "<space>ss",
					visual_send = "<space>ss",
					send_file = "<space>sf",
					send_line = "<space>sl",
					send_until_cursor = "<space>su",
					send_mark = "<space>sm",
					mark_motion = "<space>sm",
					mark_visual = "<space>sm",
					remove_mark = "<space>sd",
					cr = "<space>s<cr>",
					interrupt = "<space>s<space>",
					exit = "<space>sq",
					clear = "<space>sL",
				},
			})
		end,
		cmd = { "IronRepl" },
	},
	{
		"dccsillag/magma-nvim",
		build = ":UpdateRemotePlugins",
		cmd = { "MagmaEvaluateLine", "MagmaEvalFile", "MagmaEvaluateCell" },
	},
	{
		"michaelb/sniprun",
		build = "bash install.sh",
		config = function()
			require("sniprun").setup({
				-- repl_enable = { "Python3_original", "python3_original", "python", "python3" },
			})
		end,
		cmd = { "SnipRun", "SnipReset", "SnipInfo", "SnipLive" },
		keys = {
			-- vim.api.nvim_set_keymap("v", "<leader>e", ":SnipRun<CR>", { silent = true })
			-- vim.api.nvim_set_keymap("n", "<leader>E", "<Plug>SnipRunOperator", { silent = true })
			-- vim.api.nvim_set_keymap("n", "<leader>ee", ":SnipRun<CR>", { silent = true })
			-- vim.api.nvim_set_keymap("n", "<leader>ef", ":%SnipRun<CR>", { silent = true })
			-- vim.api.nvim_set_keymap("n", "<leader>er", ":SnipReset<CR>", { silent = true })
			-- vim.api.nvim_set_keymap("n", "<leader>ec", ":SnipClose<CR>", { silent = true })
			{ "<leader>ee", ":SnipRun<CR>", { mode = "x", "n" } },
			{ "<leader>ef", ":%SnipRun<CR>" },
			{ "<leader>er", ":SnipReset<CR>" },
			{ "<leader>ec", ":SnipClose<CR>" },
			{ "<leader>E", "<Plug>SnipRunOperator" }, -- text object
		},
	},
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
		end,
	},
	{
		"mickael-menu/zk-nvim",
		config = function()
			require("zk").setup({
				picker = "telescope",

				lsp = {
					-- `config` is passed to `vim.lsp.start_client(config)`
					config = {
						cmd = { "zk", "lsp" },
						name = "zk",
						-- on_attach = ...
						-- etc, see `:h vim.lsp.start_client()`
					},

					-- automatically attach buffers in a zk notebook that match the given filetypes
					auto_attach = {
						enabled = true,
						filetypes = { "markdown" },
					},
				},
			})
		end,
		cmd = { "ZkNew", "ZkNotes", "ZkTags" },
		keys = {
			{ "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>" },
			{ "<leader>zw", "<Cmd>ZkNew { group = 'work' }<CR>" },
			{ "<leader>zd", "<Cmd>ZkNew { group = 'diary' }<CR>" },
			{ "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>" },
			{ "<leader>zt", "<Cmd>ZkTags<CR>" },
		},
	},
	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,
		dependencies = {
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			-- { "petertriho/cmp-git", config = true },
			"saadparwaiz1/cmp_luasnip",
		},
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	-- {
	-- 	"m4xshen/hardtime.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {},
	-- },
	{
		"ThePrimeagen/harpoon",
		keys = {
			{ "<leader>A", ":lua require('harpoon.mark').add_file()<CR>" },
			{ "<leader>a", ":lua require('harpoon.ui').toggle_quick_menu()<CR>" },
			{ "<M-j>", ":lua require('harpoon.ui').nav_file(1)<CR>" },
			{ "<M-k>", ":lua require('harpoon.ui').nav_file(2)<CR>" },
			{ "<M-l>", ":lua require('harpoon.ui').nav_file(3)<CR>" },
		},
	},
	{
		"olexsmir/gopher.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			commands = {
				go = "go",
				gomodifytags = "gomodifytags",
				gotests = "gotests",
				impl = "impl",
				iferr = "iferr",
			},
		},
		cmd = {
			"GoInstallDeps",
			"GoTagAdd",
			"GoTagRm",
			"GoMod",
			"GoGet",
			"GoImpl",
			"GoTestAdd",
			"GoTestsAll",
			"GoTestsExp",
			"GoGenerate",
			"GoIfErr",
		},
	},
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup()
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"gbprod/yanky.nvim",
		keys = {
			-- { "p", "<Plug>(YankyPutAfter)", { mode = { "x", "n" } } },
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
		"tpope/vim-fugitive",
		cmd = "Git",
		event = "BufRead",
	},
	{
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
		keys = {
			{ "<leader>la", ":CodeActionMenu<CR>" },
		},
	},
	{
		"tpope/vim-unimpaired",
		keys = { "[f", "]f", "[q", "]q" },
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"tpope/vim-dispatch",
		cmd = "Dispatch",
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
		config = function()
			require("git-conflict").setup()
		end,
		lazy = false,
		event = "VeryLazy",
	},
	{
		"knsh14/vim-github-link",
		keys = { { "<leader>gL", "<CMD>GetCommitLink<CR>" } },
	},

	{
		"numToStr/Comment.nvim",
		opts = overrides.comment,
	},

	{
		"nvim-tree/nvim-tree.lua",
		enabled = false,
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = overrides.telescope,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup({ mapping = { "jk", "kj" } })
		end,
	},

	{ "gabrielpoca/replacer.nvim" },

	-- To make a plugin not be loaded
	{
		"NvChad/nvim-colorizer.lua",
		enabled = false,
	},

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }

	{ import = "custom.configs.autolist" },
	{ import = "custom.configs.copilot" },
	{ import = "custom.configs.dap" },
	{ import = "custom.configs.diffview" },
	{ import = "custom.configs.mason" },
	{ import = "custom.configs.neotest" },
	{ import = "custom.configs.oil" },
	{ import = "custom.configs.symbols-outline" },
	{ import = "custom.configs.treesitter" },
	{ import = "custom.configs.trouble" },
}

return plugins
