---@type MappingsTable
local M = {}

M.disabled = {
	n = {
		["<leader>w"] = "",
		["<leader>wa"] = "",
		["<leader>ma"] = "",
		["<leader>wk"] = "",
		["<leader>wK"] = "",
		["<leader>wl"] = "",
		["<leader>wr"] = "",
		["<leader>fm"] = "",
		["<leader>n"] = "",
		["<leader>rn"] = "",
		["<leader>/"] = "",
		["<C-a>"] = "",
		["<C-c>"] = "",
		["<C-n>"] = "",
		["<C-b>"] = "",

		["<leader>h"] = "",
		["<leader>v"] = "",
		["<leader>rh"] = "",
		["<leader>ph"] = "",
		["<leader>gb"] = "",
		["<leader>td"] = "",
	},
}

-- TODO: Can I just dump these here???
vim.keymap.set({ "x", "o" }, "al", ":<C-u>norm! 0v$<cr>", { desc = "Line text object" })
vim.keymap.set({ "x", "o" }, "il", ":<C-u>norm! _vg_<cr>", { desc = "Line text object" })

vim.keymap.set({ "x", "o" }, "ae", ":<C-u>norm! mzggVG<CR>", { desc = "Entire buffer text object" })
vim.keymap.set({ "x", "o" }, "ie", ":<C-u>norm! mzggVG<CR>", { desc = "Entire buffer text object" })
vim.keymap.set({ "i" }, "<C-s>", "<esc>:w<CR>a", { desc = "Save" })

vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
vim.keymap.set({ "o", "x" }, "ah", ":<C-U>Gitsigns select_hunk<CR>")

M.general = {
	n = {
		-- [";"] = { ":", "enter command mode", opts = { nowait = true } },
		-- [";"] = { ':lua require("oil").open()<CR>', "oil" },
		-- [";"] = { function() require("oil").open() end, "oil" },
		["<leader>gg"] = { ":tab Git<CR>" },
		["<leader><CR>"] = { ":make<CR>" },
		["<leader>v"] = { ":e $HOME/.config/nvim/lua/custom/init.lua<CR>" },
		["<leader>w"] = { "<C-w>" },
		["<leader>k"] = { ":Telescope keymaps<CR>" },
		-- ["<leader>la"] = { vim.lsp.buf.code_action, "code action" },
		["<leader>lf"] = { vim.lsp.buf.format, "format" },
		["<leader>/"] = {
			function()
				local builtin = require("telescope.builtin")
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end,
			"search",
		},
		["<leader>fw"] = {
			function()
				local builtin = require("telescope.builtin")
				builtin.grep_string()
			end,
			"search",
		},

		["<leader>r"] = { ":Telescope resume", "resume" },
		["<leader>lr"] = { ":lua require('nvchad_ui.renamer').open()<CR>", "rename" },
		["<leader>ld"] = { ":lua vim.diagnostic.open_float({ border = 'rounded' })", "diagnostics" },

		["<leader>M"] = { ":put =execute('messages')<CR>", "Messages to a buffer" },
		["<leader><leader>"] = { ":Telescope find_files<CR>", "Find files" },

		["<leader>Q"] = { ':lua require("replacer").run()<cr>', "replacer" },

		["<leader>hs"] = {
			function()
				require("gitsigns").stage_hunk()
			end,
			"Stage hunk",
		},
		["<leader>hd"] = {
			function()
				require("gitsigns").diffthis()
			end,
			"Diff this",
		},
		["<leader>hD"] = {
			function()
				require("gitsigns").diffthis("~")
			end,
			"Diff this ~",
		},
		["<leader>hr"] = {
			function()
				require("gitsigns").reset_hunk()
			end,
			"Reset hunk",
		},

		["<leader>hp"] = {
			function()
				require("gitsigns").preview_hunk()
			end,
			"Preview hunk",
		},

		["<leader>gb"] = {
			function()
				package.loaded.gitsigns.blame_line()
			end,
			"Blame line",
		},

		["<leader>ht"] = {
			function()
				require("gitsigns").toggle_deleted()
			end,
			"Toggle deleted",
		},

		["<leader>H"] = {
			function()
				require("nvterm.terminal").new("horizontal")
			end,
			"New horizontal term",
		},

		["<leader>V"] = {
			function()
				require("nvterm.terminal").new("vertical")
			end,
			"New vertical term",
		},

		-- ["<leader>lo"] = { ":Telescope lsp_document_symbols<CR>", "outline" },
	},
}

-- Extras example
-- M.symbols_outline = {
--   n = {
--     ["<leader>cs"] = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
--   },
-- }

-- more keybinds!

return M
-- *[a*     |:previous|
-- *]a*     |:next|
-- *[A*     |:first|
-- *]A*     |:last|
-- *[b*     |:bprevious|
-- *]b*     |:bnext|
-- *[B*     |:bfirst|
-- *]B*     |:blast|
-- *[l*     |:lprevious|
-- *]l*     |:lnext|
-- *[L*     |:lfirst|
-- *]L*     |:llast|
-- *[<C-L>* |:lpfile|
-- *]<C-L>* |:lnfile|
-- *[q*     |:cprevious|
-- *]q*     |:cnext|
-- *[Q*     |:cfirst|
-- *]Q*     |:clast|
-- *[<C-Q>* |:cpfile| (Note that <C-Q> only works in a terminal if you disable
-- *]<C-Q>* |:cnfile| flow control: stty -ixon)
-- *[t*     |:tprevious|
-- *]t*     |:tnext|
-- *[T*     |:tfirst|
-- *]T*     |:tlast|
-- *[<C-T>* |:ptprevious|
-- *]<C-T>* |:ptnext|
