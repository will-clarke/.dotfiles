-- vim:foldmethod=marker

--  settings {{{
-- vim.cmd([[set foldmethod=expr]])
-- vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])
-- vim.cmd([[set nofoldenable]]) -- Disable folding at startup.

require("me")

-- -- persitent undo
-- local undodir = vim.fn.stdpath("config") .. "/undodir"
-- -- Create the undodir directory if it doesn't exist
-- if vim.fn.isdirectory(undodir) == 0 then
-- 	vim.fn.mkdir(undodir, "p")
-- end
-- -- Set the undodir and enable undofile
-- vim.cmd("set undodir=" .. undodir)
-- vim.cmd("set undofile")

-- }}}

-- plugins {{{
-- }}}

-- lsp {{{
-- local ok, lsp_zero = pcall(require, "lsp-zero")
-- if ok then
-- 	lsp_zero.on_attach(function(client, bufnr)
-- 		lsp_zero.default_keymaps({ buffer = bufnr })
-- 	end)
--
-- 	require("lspconfig").rust_analyzer.setup({})
-- 	require("lspconfig").gopls.setup({})
-- 	require("lspconfig").pyright.setup({})
-- 	require("lspconfig").lua_ls.setup({
-- 		settings = {
-- 			Lua = {
-- 				diagnostics = {
-- 					globals = { "vim" },
-- 				},
-- 			},
-- 		},
-- 	})
-- end

-- linting formatting etc
-- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
-- local null_ls_sources = {}
-- local null_ls_ok, null_ls = pcall(require, "null-ls")
-- if null_ls_ok then
-- 	null_ls_sources = {
-- 		null_ls.builtins.formatting.autoflake,
-- 		null_ls.builtins.formatting.jq,
-- 		null_ls.builtins.diagnostics.mypy,
-- 		null_ls.builtins.code_actions.shellcheck,
-- 		null_ls.builtins.formatting.stylua,
-- 		null_ls.builtins.diagnostics.jsonlint,
-- 	}
-- 	null_ls.setup({
-- 		sources = null_ls_sources,
-- 	})
-- end

-- local mason_ok, mason = pcall(require, "mason")
-- if mason_ok then
-- 	local packages = {
-- 		"gopls",
-- 		"rust-analyzer",
-- 		"lua-language-server",
-- 		"stylua",
-- 	}
-- 	-- if null_ls_sources , append to packages
-- 	for _, source in ipairs(null_ls_sources) do
-- 		local name = source.name
-- 		if name then
-- 			table.insert(packages, name)
-- 		end
-- 	end
--
-- 	vim.api.nvim_create_user_command("MasonInstallAll", function()
-- 		vim.cmd("MasonInstall " .. table.concat(packages, " "))
-- 	end, {})
--
-- 	local reg_ok, registry = pcall(require, "mason-registry")
-- 	if reg_ok then
-- 		registry.refresh(function()
-- 			for _, pkg_name in ipairs(packages) do
-- 				local pkg = registry.get_package(pkg_name)
-- 				if not pkg:is_installed() then
-- 					pkg:install()
-- 				end
-- 			end
-- 		end)
-- 	end
-- end
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
