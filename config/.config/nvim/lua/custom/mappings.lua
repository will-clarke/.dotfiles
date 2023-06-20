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
	},
}

-- TODO: Can I just dump these here???
vim.keymap.set({ "x", "o" }, "al", ":<C-u>norm! 0v$<cr>", { desc = "Line text object" })
vim.keymap.set({ "x", "o" }, "il", ":<C-u>norm! _vg_<cr>", { desc = "Line text object" })

vim.keymap.set({ "x", "o" }, "ae", ":<C-u>norm! mzggVG<CR>", { desc = "Entire buffer text object" })
vim.keymap.set({ "x", "o" }, "ie", ":<C-u>norm! mzggVG<CR>", { desc = "Entire buffer text object" })
vim.keymap.set({ "i" }, "<C-s>", "<esc>:w<CR>a", { desc = "Save" })

M.general = {
	n = {
		-- [";"] = { ":", "enter command mode", opts = { nowait = true } },
		-- [";"] = { ':lua require("oil").open()<CR>', "oil" },
		-- [";"] = { function() require("oil").open() end, "oil" },
		["<leader>gg"] = { ":Git<CR>" },
		["<leader>V"] = { ":e $HOME/.config/nvim/lua/custom/init.lua<CR>" },
		["<leader>w"] = { "<C-w>" },
		["<leader>k"] = { ":Telescope keymaps<CR>" },
		-- ["<leader>la"] = { vim.lsp.buf.code_action, "code action" },
		["<leader>lf"] = { vim.lsp.buf.format, "format" },
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
