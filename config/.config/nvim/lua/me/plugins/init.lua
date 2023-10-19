return {
	"folke/which-key.nvim",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"tpope/vim-dispatch",
	"tpope/vim-unimpaired", -- ]q ]a ]f ]< > ]e ]n ]ow ]ol
	"folke/neodev.nvim",
	"nvim-treesitter/nvim-treesitter",
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"hrsh7th/cmp-emoji",
	"nvim-treesitter/nvim-treesitter-context",
	"nvim-telescope/telescope-live-grep-args.nvim",
	{
		"rest-nvim/rest.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("rest-nvim").setup({})
		end,
		cmd = {},
	},
	{
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({
				enabled = false,
			})
		end,
	},
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").load_extension("ui-select")
		end,
	},
	-- {
	-- 	"PHSix/nvim-hybrid",
	-- 	config = function()
	-- 		require("hybrid").setup()
	-- 		-- or use
	-- 		-- vim.cmd [[colorscheme nvim-hybrid]]
	-- 	end,
	-- },
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,

						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,

						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["aa"] = "@attribute.outer",
							["ia"] = "@attribute.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },

							["ab"] = "@block.outer",
							["ib"] = "@block.inner",
							["ad"] = "@conditional.outer",
							["id"] = "@conditional.inner",
							["ao"] = "@loop.outer",
							["io"] = "@loop.inner",
							-- ["ap"] = "@parameter.outer",
							-- ["ip"] = "@parameter.inner",
							["a/"] = "@comment.outer",
							["ar"] = "@frame.outer",
							["ir"] = "@frame.inner",
							["at"] = "@attribute.outer",
							["it"] = "@attribute.inner",
							["as"] = "@statement.outer",
							["is"] = "@statement.outer",
						},
						-- You can choose the select mode (default is charwise 'v')
						--
						-- Can also be a function which gets passed a table with the keys
						-- * query_string: eg '@function.inner'
						-- * method: eg 'v' or 'o'
						-- and should return the mode ('v', 'V', or '<c-v>') or a table
						-- mapping query_strings to modes.
						-- selection_modes = {
						-- 	['@parameter.outer'] = 'v', -- charwise
						-- 	['@function.outer'] = 'V', -- linewise
						-- 	['@class.outer'] = '<c-v>', -- blockwise
						-- },
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]f"] = "@call.outer",
						["]d"] = "@conditional.outer",
						["]o"] = "@loop.outer",
						["]s"] = "@statement.outer",
						["]a"] = "@parameter.outer",
						["]c"] = "@comment.outer",
						["]b"] = "@block.outer",
						["]l"] = { query = "@class.outer", desc = "next class start" },
						["]r"] = "@frame.outer",
						["]t"] = "@attribute.outer",
						["]e"] = "@scopename.outer",
						["]]m"] = "@function.inner",
						["]]f"] = "@call.inner",
						["]]d"] = "@conditional.inner",
						["]]o"] = "@loop.inner",
						["]]a"] = "@parameter.inner",
						["]]b"] = "@block.inner",
						["]]l"] = { query = "@class.inner", desc = "next class start" },
						["]]r"] = "@frame.inner",
						["]]t"] = "@attribute.inner",
						["]]e"] = "@scopename.inner",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]F"] = "@call.outer",
						["]D"] = "@conditional.outer",
						["]O"] = "@loop.outer",
						["]S"] = "@statement.outer",
						["]A"] = "@parameter.outer",
						["]C"] = "@comment.outer",
						["]B"] = "@block.outer",
						["]L"] = "@class.outer",
						["]R"] = "@frame.outer",
						["]T"] = "@attribute.outer",
						["]E"] = "@scopename.outer",
						["]]M"] = "@function.inner",
						["]]F"] = "@call.inner",
						["]]D"] = "@conditional.inner",
						["]]O"] = "@loop.inner",
						["]]A"] = "@parameter.inner",
						["]]B"] = "@block.inner",
						["]]L"] = "@class.inner",
						["]]R"] = "@frame.inner",
						["]]T"] = "@attribute.inner",
						["]]E"] = "@scopename.inner",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[F"] = "@call.outer",
						["[D"] = "@conditional.outer",
						["[O"] = "@loop.outer",
						["[S"] = "@statement.outer",
						["[A"] = "@parameter.outer",
						["[C"] = "@comment.outer",
						["[B"] = "@block.outer",
						["[L"] = "@class.outer",
						["[R"] = "@frame.outer",
						["[T"] = "@attribute.outer",
						["[E"] = "@scopename.outer",
						["[[M"] = "@function.inner",
						["[[F"] = "@call.inner",
						["[[D"] = "@conditional.inner",
						["[[O"] = "@loop.inner",
						["[[A"] = "@parameter.inner",
						["[[B"] = "@block.inner",
						["[[L"] = "@class.inner",
						["[[R"] = "@frame.inner",
						["[[T"] = "@attribute.inner",
						["[[E"] = "@scopename.inner",
					},
				},
			})
		end,
	},
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup({ mapping = { "jk", "jj", "kj" } })
		end,
	},
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup({})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				integrations = {
					harpoon = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-go",
		},
		config = function()
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						local message =
							diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)
			require("neotest").setup({
				adapters = {
					require("neotest-go"),
				},
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{
		"ldelossa/gh.nvim",
		dependencies = { "ldelossa/litee.nvim" },
		config = function()
			require("litee.lib").setup()
			require("litee.gh").setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
	},
	-- {
	-- 	"VonHeikemen/lsp-zero.nvim",
	-- 	branch = "v3.x",
	-- },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"knubie/vim-kitty-navigator",
		event = "VeryLazy",
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
		},
		config = true,
		event = "VeryLazy",
	},
	{
		"zbirenbaum/copilot-cmp",
		event = "InsertEnter",
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			vim.defer_fn(function()
				require("copilot").setup()
				require("copilot_cmp").setup()
			end, 100)
		end,
	},
	{
		"linty-org/readline.nvim",
		-- Can we apply defaults?
		config = function()
			local readline = require("readline")
			vim.keymap.set("!", "<C-k>", readline.kill_line)
			vim.keymap.set("!", "<C-u>", readline.backward_kill_line)
			vim.keymap.set("!", "<M-d>", readline.kill_word)
			vim.keymap.set("!", "<M-BS>", readline.backward_kill_word)
			vim.keymap.set("!", "<C-w>", readline.unix_word_rubout)
			vim.keymap.set("!", "<C-d>", "<Delete>") -- delete-char
			vim.keymap.set("!", "<C-h>", "<BS>") -- backward-delete-char
			vim.keymap.set("!", "<C-a>", readline.beginning_of_line)
			vim.keymap.set("!", "<C-e>", readline.end_of_line)
			vim.keymap.set("!", "<M-f>", readline.forward_word)
			vim.keymap.set("!", "<M-b>", readline.backward_word)
			vim.keymap.set("!", "<C-f>", "<Right>") -- forward-char
			vim.keymap.set("!", "<C-b>", "<Left>") -- backward-char
			vim.keymap.set("!", "<C-n>", "<Down>") -- next-line
			vim.keymap.set("!", "<C-p>", "<Up>") -- previous-line
		end,
	},
	{
		"mickael-menu/zk-nvim",
		config = function()
			require("zk").setup({
				picker = "telescope",

				lsp = {
					config = {
						cmd = { "zk", "lsp" },
						name = "zk",
					},
					auto_attach = {
						enabled = true,
						filetypes = { "markdown" },
					},
				},
			})
		end,
		cmd = { "ZkNew", "ZkNotes", "ZkTags" },
		keys = {
			{ "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", "Zk New" },
			{ "<leader>zw", "<Cmd>ZkNew { group = 'work' }<CR>", "Zk Work" },
			{ "<leader>zd", "<Cmd>ZkNew { group = 'diary' }<CR>", "Zk Diary" },
			{ "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", "Zk Open" },
			{ "<leader>zt", "<Cmd>ZkTags<CR>", "Zk Tags" },
		},
	},
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
	{
		"stevearc/oil.nvim",
		lazy = false,
		opts = {
			win_options = {
				concealcursor = "nivc",
			},
			default_file_explorer = true,
			view_options = {
				show_hidden = true,
			},
			use_default_keymaps = false,
			columns = {
				"icon",
				"permissions",
				"size",
				"mtime",
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
		event = "VeryLazy",
	},
}
