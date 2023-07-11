local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options
	{
		"michaelb/sniprun",
		build = "bash install.sh",
		config = function()
			vim.api.nvim_set_keymap("v", "<leader>e", ":SnipRun<CR>", { silent = true })
			vim.api.nvim_set_keymap("n", "<leader>e", "<Plug>SnipRunOperator", { silent = true })
			vim.api.nvim_set_keymap("n", "<leader>ee", ":SnipRun<CR>", { silent = true })
			vim.api.nvim_set_keymap("n", "<leader>er", ":SnipReset<CR>", { silent = true })
			vim.api.nvim_set_keymap("n", "<leader>ec", ":SnipClose<CR>", { silent = true })

			require("sniprun").setup({
				-- repl_enable = { "Python3_original", "python3_original", "python", "python3" },
			})
		end,
		cmd = { "SnipRun", "SnipReset", "SnipInfo", "SnipLive" },
		keys = {
			"<leader>ee",
			-- { "<leader>e", ":SnipRun<CR>", { mode = "x", "n" } },
			-- { "<leader>ee", "<Plug>SnipRunOperator" }, -- text object
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
				-- See Setup section below
			})
		end,
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
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
		event = "VeryLazy",
	},
	{
		"leoluz/nvim-dap-go",
		config = function()
			require("dap-go").setup()
		end,
		event = "VeryLazy",
	},
	{
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		event = "VeryLazy",
		config = function()
			require("dapui").setup()

			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
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
		config = true,
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
		"gaoDean/autolist.nvim",
		ft = {
			"markdown",
			"text",
			"tex",
			"plaintex",
			"norg",
		},
		config = function()
			require("autolist").setup()

			-- vim.keymap.del("i", "<CR>")
			vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
			vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
			-- vim.keymap.set("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- an example of using <c-t> to indent
			vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
			vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
			vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
			vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
			vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>")

			-- cycle list types with dot-repeat
			vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
			vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })

			-- if you don't want dot-repeat
			-- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
			-- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")

			-- functions to recalculate list on edit
			vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
			vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
			vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
			vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
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
		config = function()
			require("git-conflict").setup()
		end,
		event = "BufRead",
		keys = { "co", "ct", "cb", "c0", "[x", "]x" },
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
		"stevearc/oil.nvim",
		lazy = false,
		opts = {
			win_options = {
				concealcursor = "nivc",
			},
			default_file_explorer = true,
			view_options = {
				-- show_hidden = true,
			},
			use_default_keymaps = false,
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
				["<C-r>"] = "actions.refresh",
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

	{
		"nvim-neotest/neotest",

		keys = {
			{ "<leader>tt", ":lua require('neotest').run.run()<CR>", "test" },
			{ "<leader>tf", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "test file" },
			{ "<leader>td", ":lua require('neotest').run.run({strategy = 'dap'})<CR>", "test debug" },
			{ "<leader>tS", ":lua require('neotest').run.stop()<CR>", "test stop" },
			{ "<leader>ta", ":lua require('neotest').run.attach()<CR>", "test attach" },
			{
				"<leader>tl",
				function()
					require("neotest").run.run_last()
				end,
				"test last",
			},
			{ "<leader>ts", ":lua require('neotest').summary.toggle()<CR>", "test summary" },
			{ "<leader>to", ":lua require('neotest').output.open({enter = true})<CR>", "test output" },
			{ "<leader>tO", ":lua require('neotest').output_panel.toggle()<CR>", "test output panel" },
			-- require("neotest").summary.toggle()
			--require("neotest").output.open({ enter = true })
			--require("neotest").output_panel.toggle()
		},

		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-go",
		},

		config = function()
			require("neotest").setup({

				floating = {
					border = "rounded",
					max_height = 0.95,
					max_width = 0.95,
				},
				adapters = {

					require("neotest-go")({
						experimental = {
							test_table = true,
						},
						args = { "-count=1", "-timeout=60s" },
					}),
				},
			})
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

	{ import = "custom.configs.copilot" },
	{ import = "custom.configs.diffview" },
	-- { import = "custom.configs.lspconfig" }, -- included above
	{ import = "custom.configs.mason" },
	-- { import = "custom.configs.null-ls" }, -- included above
	{ import = "custom.configs.symbols-outline" },
	{ import = "custom.configs.treesitter" },
	{ import = "custom.configs.trouble" },
}

return plugins
