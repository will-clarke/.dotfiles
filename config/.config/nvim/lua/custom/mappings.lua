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
		["<C-a>"] = "",
	},
}

M.general = {
	n = {
		-- [";"] = { ":", "enter command mode", opts = { nowait = true } },
		-- [";"] = { ':lua require("oil").open()<CR>', "oil" },
		-- [";"] = { function() require("oil").open() end, "oil" },
		["<leader>gg"] = { ":Git<CR>" },
		["<leader>V"] = { ":e $HOME/.config/nvim/lua/custom/init.lua<CR>" },
		["<leader>w"] = { "<C-w>" },
		["<leader>k"] = { ":Telescope keymaps<CR>" },
		["<leader>la"] = { vim.lsp.buf.code_action, "code action" },
		["<leader>lf"] = { vim.lsp.buf.format, "format" },
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
