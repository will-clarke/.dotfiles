local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"markdown",
		"markdown_inline",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"prettier",

		-- c/cpp stuff
		"clangd",
		"clang-format",

		"gopls",
		"gofumpt",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.cmp = {
	mapping = {
		["<C-k>"] = function()
			local cmp = require("cmp")
			cmp.mapping.select_prev_item()
		end,
		["<C-j>"] = function()
			local cmp = require("cmp")
			cmp.mapping.select_next_item()
		end,
		["<CR>"] = function()
			local cmp = require("cmp")
			cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = false,
			})
		end,
		-- sources = {
		-- 	{ name = "nvim_lsp" },
		-- 	{ name = "luasnip" },
		-- 	{ name = "buffer" },
		-- 	{ name = "nvim_lua" },
		-- 	{ name = "path" },
		-- },
	},
}

-- mapping = cmp.mapping.preset.insert({
--     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<C-e>'] = cmp.mapping.abort(),
--     ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--   }),

local actions = require("telescope.actions")
M.telescope = {
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
}

return M
