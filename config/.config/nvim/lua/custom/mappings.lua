---@type MappingsTable
local M = {}

M.general = {
	n = {
		-- [";"] = { ":", "enter command mode", opts = { nowait = true } },
		-- [";"] = { ':lua require("oil").open()<CR>', "oil" },
		[";"] = { function() require("oil").open() end, "oil" },
		["<leader>gg"] = { ":Git<CR>" },
		["<leader>V"] = { ":e $HOME/.dotfiles/config/.config/nvim/lua/custom<CR>" },
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
