-- vim:foldmethod=marker

-- lazy setup {{{
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
-- }}}

--  settings {{{
vim.api.nvim_set_option("clipboard", "unnamed")
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.o.background = "dark"
vim.opt.number = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.g.gitblame_enabled = false
vim.cmd([[set foldmethod=expr]])
vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])
vim.cmd([[set nofoldenable]]) -- Disable folding at startup.

-- persitent undo
local undodir = vim.fn.stdpath("config") .. "/undodir"
-- Create the undodir directory if it doesn't exist
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
-- Set the undodir and enable undofile
vim.cmd("set undodir=" .. undodir)
vim.cmd("set undofile")

-- }}}

-- plugins {{{
require("lazy").setup({
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
		"nvimtools/none-ls.nvim",
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
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
	},
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
})
-- }}}

-- lsp {{{
local ok, lsp_zero = pcall(require, "lsp-zero")
if ok then
	lsp_zero.on_attach(function(client, bufnr)
		lsp_zero.default_keymaps({ buffer = bufnr })
	end)

	require("lspconfig").rust_analyzer.setup({})
	require("lspconfig").gopls.setup({})
	require("lspconfig").pyright.setup({})
	require("lspconfig").lua_ls.setup({
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	})
end

-- linting formatting etc
-- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
local null_ls_sources = {}
local null_ls_ok, null_ls = pcall(require, "null-ls")
if null_ls_ok then
	null_ls_sources = {
		null_ls.builtins.formatting.autoflake,
		null_ls.builtins.formatting.jq,
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.code_actions.shellcheck,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.jsonlint,
	}
	null_ls.setup({
		sources = null_ls_sources,
	})
end

local mason_ok, mason = pcall(require, "mason")
if mason_ok then
	local packages = {
		"gopls",
		"rust-analyzer",
		"lua-language-server",
		"stylua",
	}
	-- if null_ls_sources , append to packages
	for _, source in ipairs(null_ls_sources) do
		local name = source.name
		if name then
			table.insert(packages, name)
		end
	end

	vim.api.nvim_create_user_command("MasonInstallAll", function()
		vim.cmd("MasonInstall " .. table.concat(packages, " "))
	end, {})

	local reg_ok, registry = pcall(require, "mason-registry")
	if reg_ok then
		registry.refresh(function()
			for _, pkg_name in ipairs(packages) do
				local pkg = registry.get_package(pkg_name)
				if not pkg:is_installed() then
					pkg:install()
				end
			end
		end)
	end
end
-- }}}

-- which key {{{
local wk_ok, wk = pcall(require, "which-key")
if wk_ok then
	wk.register({
		gd = { "<cmd>Telescope lsp_definitions<CR>", "definition" },
		gr = { "<cmd>Telescope lsp_references<CR>", "references" },
		gi = { "<cmd>Telescope lsp_implementations<CR>", "implementations" },
		["M-c"] = { '"+y<ESC>', "yank" },
		["<leader>"] = {
			["?"] = { "<CMD>Telescope keymaps<CR>", "keymaps" },
			["<CR>"] = { "<CMD>Make<CR>", "make" },
			[" "] = { ":Telescope frecency workspace=CWD<CR>", "Telescope frequency workspace=CWD" },
			["/"] = { ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Search text" },
			["."] = { ":Telescope grep_string<CR>", "grep string" },
			[";"] = { ":Telescope resume<CR>", "resume" },
			d = { ":Telescope diagnostics<CR>", "diagnostics" },
			q = { "<CMD>copen<CR>", "quickfix" },
			n = { ":enew<CR>", "cnext" },
			m = { ":cnext<CR>", "cnext" },
			M = { ":TSJToggle<CR>", "Join toggle" },
			[","] = { ":cprev<CR>", "cprev" },
			s = { ":lua require('harpoon.ui').toggle_quick_menu()<CR>", "harpoon" },
			a = { ":lua require('harpoon.mark').add_file()<CR>", "add harpoon" },
			j = { ':lua require("harpoon.ui").nav_file(1)<CR>', "harpoon #1" },
			k = { ':lua require("harpoon.ui").nav_file(2)<CR>', "harpoon #2" },
			c = { ":e ~/.config/nvim/init.lua<CR>", "config" },
			["'"] = { ':lua require("harpoon.term").gotoTerminal(1)<CR>', "harpoon term" },
			r = { "<CMD>Telescope frecency<CR>", "recent files" },
			l = {
				name = "LSP",
				a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "codea action" },
				f = { "<cmd>lua vim.lsp.buf.format()<CR>", "format" },
				r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename" },
				w = { "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "workspace symbol" },
				p = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "previous diagnostic" },
				n = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "next diagnostic" },
				d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "diagnostic" },
				o = { "<cmd>Telescope lsp_document_symbols<CR>", "outline" },
			},
			t = {
				t = { "<cmd>lua require('neotest').run.run({path, extra_args = {'-race'}})<CR>", "test" },
				f = { "<CMD>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "test file" },
				a = { "<CMD>lua require('neotest').run.attach()<CR>", "attach" },
				o = { "<CMD>lua require('neotest').output_panel.toggle()<CR>", "output" },
				O = { "<CMD>lua require('neotest').output.open({ enter = true })<CR>", "Output" },
				s = { "<CMD>lua require('neotest').summary.toggle()<CR>", "summary" },
				l = { "<CMD>lua require('neotest').run.run_last()<CR>", "last" },
			},
			g = {
				g = { "<CMD>Neogit<CR>", "git" },
				b = { "<CMD>GitBlameToggle<CR>", "git blame" },
				y = { "<CMD>GitBlameCopyFileURL<CR>", "yank" },
				h = {
					name = "+Github",
					c = {
						name = "+Commits",
						c = { "<cmd>GHCloseCommit<cr>", "Close" },
						e = { "<cmd>GHExpandCommit<cr>", "Expand" },
						o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
						p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
						z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
					},
					i = {
						name = "+Issues",
						p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
					},
					l = {
						name = "+Litee",
						t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
					},
					r = {
						name = "+Review",
						b = { "<cmd>GHStartReview<cr>", "Begin" },
						c = { "<cmd>GHCloseReview<cr>", "Close" },
						d = { "<cmd>GHDeleteReview<cr>", "Delete" },
						e = { "<cmd>GHExpandReview<cr>", "Expand" },
						s = { "<cmd>GHSubmitReview<cr>", "Submit" },
						z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
					},
					p = {
						name = "+Pull Request",
						c = { "<cmd>GHClosePR<cr>", "Close" },
						d = { "<cmd>GHPRDetails<cr>", "Details" },
						e = { "<cmd>GHExpandPR<cr>", "Expand" },
						o = { "<cmd>GHOpenPR<cr>", "Open" },
						p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
						r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
						t = { "<cmd>GHOpenToPR<cr>", "Open To" },
						z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
					},
					t = {
						name = "+Threads",
						c = { "<cmd>GHCreateThread<cr>", "Create" },
						n = { "<cmd>GHNextThread<cr>", "Next" },
						t = { "<cmd>GHToggleThread<cr>", "Toggle" },
					},
				},
			},
			N = {
				'<CMD>execute "set number!" | echo "Line numbers are now " . ( &number ? "enabled" : "disabled" )',
				"number toggle",
			},
			W = {
				"<CMD>execute 'set wrap!' | echo 'Wrap is now ' . ( &wrap ? 'enabled' : 'disabled' )<CR>",
				"wrap",
			},
			w = { "<CMD>w<CR>", "write" },
			f = {
				name = "Find",
				f = { "<cmd>Telescope find_files<cr>", "Find File" },
				r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false },
				n = { "<cmd>e tmp<cr>", "New File" }, -- just a label. don't create any mapping
			},
		},
	})
end

vim.keymap.set({ "x", "o" }, "al", ":<C-u>norm! 0v$<cr>", { desc = "Line text object" })
vim.keymap.set({ "x", "o" }, "il", ":<C-u>norm! _vg_<cr>", { desc = "Line text object" })

vim.keymap.set({ "x", "o" }, "ae", ":<C-u>norm! mzggVG<CR>", { desc = "Entire buffer text object" })
vim.keymap.set({ "x", "o" }, "ie", ":<C-u>norm! mzggVG<CR>", { desc = "Entire buffer text object" })
-- }}}

-- cmp {{{
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local kind_icons = {
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = " ",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Copilot = "󰚩",
	Emoji = "󰎃",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = " ",
	Misc = " ",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup({
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
				copilot = "[Copilot]",
				emoji = "[Emoji]",
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "copilot", priority = 1000 },
		{ name = "emoji" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
})
-- }}}

-- treesitter {{{
require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "lua", "go" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	highlight = {
		enable = true,
	},

	indent = {
		enable = true,
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			-- init_selection = "gnn", -- set to `false` to disable one of the mappings
			node_incremental = "g<TAB>",
			-- scope_incremental = "grc",
			node_decremental = "g<S-TAB>",
		},
	},
})
-- }}}

-- telescope {{{
local lga_ok, lga_actions = pcall(require, "telescope-live-grep-args.actions")
if not lga_ok then
	print("lga not ok")
	return
end

require("telescope").setup({
	defaults = {
		layout_config = {
			horizontal = {
				width = 0.99,
				height = 0.99,
			},
		},
		mappings = {
			i = {
				["<C-j>"] = function(...)
					local actions = require("telescope.actions")
					actions.move_selection_next(...)
				end,
				["<C-k>"] = function(...)
					local actions = require("telescope.actions")
					actions.move_selection_previous(...)
				end,
				["<C-g>"] = function(...)
					local actions = require("telescope.actions")
					actions.close(...)
				end,
				["<esc>"] = function(...)
					local actions = require("telescope.actions")
					actions.close(...)
				end,
			},
		},
	},
	pickers = {},
	extensions = {

		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
		live_grep_args = {
			auto_quoting = true,
			mappings = {
				i = {
					["<C-y>"] = lga_actions.quote_prompt(),
					["<C-v>"] = lga_actions.quote_prompt({ postfix = " -g!vendor " }),
					["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
				},
			},
		},
	},
})
-- }}}

local rest_ok, rest = pcall(require, "rest-nvim")
if not rest_ok then
	vim.notify("RestNvim not loaded", 3)
	return
end
vim.api.nvim_create_autocmd("BufRead", {
	pattern = "*.http",
	callback = function(opts)
		vim.bo.filetype = "http"
		wk.register({
			["<leader>"] = {
				["r"] = { rest.run, "Execute" },
				["l"] = { rest.last, "Execute" },
			},
		})
	end,
})

-- autocmds {{{
local aucmd_dict = {
	TextYankPost = {
		{
			pattern = "*",
			callback = function()
				vim.highlight.on_yank({ higroup = "IncSearch", timeout = 120 })
			end,
		},
	},
	BufWinEnter = {
		{
			pattern = "COMMIT_EDITMSG,NeogitCommitMessage",
			callback = function()
				if vim.fn.getline(1) == "" then
					vim.cmd("startinsert")
				end
			end,
		},
	},
	BufWritePre = {
		{
			pattern = "*.lua",
			callback = function()
				vim.lsp.buf.format()
			end,
		},
		{
			pattern = "*.go",
			callback = function()
				vim.lsp.buf.format()
				vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
			end,
		},
	},
	FileType = {
		{
			pattern = "markdown,txt",
			callback = function()
				vim.api.nvim_win_set_option(0, "spell", true)
			end,
		},
		{
			pattern = "help,lspinfo,man,git,neotest-*,dap-float,qf,messages,startuptime",
			callback = function()
				vim.api.nvim_set_keymap("n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
			end,
		},
	},
}

for event, opt_tbls in pairs(aucmd_dict) do
	for _, opt_tbl in pairs(opt_tbls) do
		vim.api.nvim_create_autocmd(event, opt_tbl)
	end
end
-- }}}
