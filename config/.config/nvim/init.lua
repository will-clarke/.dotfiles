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

--  settings
vim.api.nvim_set_option("clipboard", "unnamed")
vim.g.mapleader = " "


-- plugins
require("lazy").setup({
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim",        cmd = "Neoconf" },
	"folke/neodev.nvim",
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		},
		lazy = false,
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{ 'neovim/nvim-lspconfig' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'L3MON4D3/LuaSnip' },
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
		config = true
	},
	{
		"hrsh7th/cmp-emoji",
	},
	{
		"zbirenbaum/copilot-cmp",
		event = "InsertEnter",
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			vim.defer_fn(function()
				require("copilot").setup() -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
				require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
			end, 100)
		end,
	},
	{
		"linty-org/readline.nvim",
		config = function()
			local readline = require 'readline'
			vim.keymap.set('!', '<C-k>', readline.kill_line)
			vim.keymap.set('!', '<C-u>', readline.backward_kill_line)
			vim.keymap.set('!', '<M-d>', readline.kill_word)
			vim.keymap.set('!', '<M-BS>', readline.backward_kill_word)
			vim.keymap.set('!', '<C-w>', readline.unix_word_rubout)
			vim.keymap.set('!', '<C-d>', '<Delete>') -- delete-char
			vim.keymap.set('!', '<C-h>', '<BS>') -- backward-delete-char
			vim.keymap.set('!', '<C-a>', readline.beginning_of_line)
			vim.keymap.set('!', '<C-e>', readline.end_of_line)
			vim.keymap.set('!', '<M-f>', readline.forward_word)
			vim.keymap.set('!', '<M-b>', readline.backward_word)
			vim.keymap.set('!', '<C-f>', '<Right>') -- forward-char
			vim.keymap.set('!', '<C-b>', '<Left>') -- backward-char
			vim.keymap.set('!', '<C-n>', '<Down>') -- next-line
			vim.keymap.set('!', '<C-p>', '<Up>') -- previous-line
		end
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
			{ "<leader>zw", "<Cmd>ZkNew { group = 'work' }<CR>",                  "Zk Work" },
			{ "<leader>zd", "<Cmd>ZkNew { group = 'diary' }<CR>",                 "Zk Diary" },
			{ "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>",         "Zk Open" },
			{ "<leader>zt", "<Cmd>ZkTags<CR>",                                    "Zk Tags" },
		},
	},
	-- {
	-- 	"Wansmer/treesj",
	-- 	config = function()
	-- 		require("treesj").setup({ use_default_keymaps = false, max_join_length = 150 })
	-- 	end,
	-- },
	{ "nvim-telescope/telescope-live-grep-args.nvim" },
	{
		'stevearc/oil.nvim',
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




-- lsp
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('lspconfig').rust_analyzer.setup({})
require 'lspconfig'.gopls.setup {}
require('lspconfig').lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
		},
	},
})



local present, mason = pcall(require, "mason")

if present then
	local packages = {
		"gopls",
		"rust-analyzer",
		"lua-language-server",
		"stylua"
	}

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

local ok, wk = pcall(require, "which-key")
if ok then
	wk.register({
		m = { "<CMD>TSJToggle<CR>", "Join" },
		g = {
			g = { "<CMD>Neogit<CR>", "git" }
		},
		W = { "<CMD>WhichKey<CR>", "which key" },
		w = { "<CMD>w<CR>", "write" },
		f = {
			f = { "<cmd>Telescope find_files<cr>", "Find File" },  -- create a binding with label
			r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false }, -- additional options for creating the keymap
			n = { "New File" },                                    -- just a label. don't create any mapping
			e = "Edit File",                                       -- same as above
			b = { function() print("bar") end, "Foobar" }          -- you can also pass functions!
		},
	}, { prefix = "<leader>" })
end




vim.cmd [[colorscheme tokyonight-night]]
vim.cmd [[autocmd BufWritePre *go lua vim.lsp.buf.format()]]



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
	local col = vim.fn.col "." - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
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

cmp.setup {
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm { select = true },
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
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "copilot" },
		{ name = 'emoji' },
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
}
