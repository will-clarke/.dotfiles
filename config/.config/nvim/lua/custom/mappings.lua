---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":lua require('oil').open()<CR>", "oil", opts = { nowait = true } },

  },
}

-- more keybinds!

return M
