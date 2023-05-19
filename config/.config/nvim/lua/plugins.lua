local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- 'kana/vim-textobj-entire',
	'folke/tokyonight.nvim',
	{
		'folke/neodev.nvim',
		config = function()
			require("neodev").setup({})
		end

	},
	{
		'nvim-lualine/lualine.nvim',
		requires = {
			'nvim-tree/nvim-web-devicons',
			opt = true,
			config = function()
				require('lualine').setup({
					options = {
						theme = 'tokyonight'
					}
				})
			end
		}
	},
	{
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	},
	"nvim-neotest/neotest-go",

	{
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-go",

		},
		config = function()
			require("neotest").setup({
				adapters = {
					-- require("neotest-plenary"),
					require("neotest-go")({
						experimental = {
							test_table = true,
						},
						args = { "-count=1", "-timeout=60s" }
					})
				}

			})
		end
	},
	'nvim-treesitter/nvim-treesitter-textobjects',
	{
		'stevearc/oil.nvim',
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup()
		end
	},
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	},
	'tpope/vim-surround',
	-- 'tpope/vim-fugitive',
	'nvim-treesitter/nvim-treesitter',
	'knsh14/vim-github-link',
	'ggandor/lightspeed.nvim',
	{
		'TimUntersberger/neogit',
		requires = 'nvim-lua/plenary.nvim',
		config = function()
			require('neogit').setup {}
		end,
	},
	{
		'nvim-pack/nvim-spectre',
		config = function()
			require('spectre').setup()
		end
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build =
		'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
	},
	{
		'ThePrimeagen/harpoon',
		config = function()
			-- require("telescope").load_extension('harpoon')
		end
	},
	'hrsh7th/cmp-nvim-lua',
	{
		'hrsh7th/nvim-cmp',
		config = function()
			local cmp = require 'cmp'

			cmp.setup {
				sources = cmp.config.sources({
					-- Copilot Source
					{ name = "copilot",  group_index = 2 },
					-- Other Sources
					{ name = "nvim_lsp", group_index = 2 },
					-- { name = 'nvim_lua' },

					{ name = "path",     group_index = 2 },
				}),
				mapping = cmp.mapping.preset.insert({
					['<C-j>'] = cmp.mapping.scroll_docs(-4),
					['<C-k>'] = cmp.mapping.scroll_docs(4),
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),

			}
		end
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup({


			})
		end
	},

	-- 'Matt-A-Bennett/vim-surround-funk',
	----	{
	--		"nvim-tree/nvim-tree.lua",
	--		version = "*",
	--		dependencies = {
	--			"nvim-tree/nvim-web-devicons",
	--		},
	--		config = function()
	--			require("nvim-tree").setup {}
	--		end,
	--	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{
				-- Optional
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' }, -- Required
		}
	},
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},
	{
		"luukvbaal/nnn.nvim",
		config = function()
			require("nnn").setup({
				explorer = {
					cmd = "nnn -e",
				},
				--			style = { border = "rounded" },
				--			session = "shared",
				--		},
				replace_netrw = "explorer",
				--	windownav = "<C-l>"
			})
		end
	},
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true

			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{ "folke/neoconf.nvim",              cmd = "Neoconf" },
	{ 'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate' },
	"folke/trouble.nvim",
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		-- or                              , branch = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim',
			'debugloop/telescope-undo.nvim',
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				extensions = { undo = {} },
				defaults = {
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
					},
				},
			})
		end
	},
	{ 'rose-pine/neovim',     name = 'rose-pine' },


	{ 'neovim/nvim-lspconfig' },

	"folke/zen-mode.nvim",
	"eandrju/cellular-automaton.nvim",
})

vim.cmd('colorscheme rose-pine')

require 'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed = { "vimdoc", "javascript", "typescript", "go", "c", "lua", "rust" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}

-- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true
vim.cmd [[colorscheme tokyonight]]
