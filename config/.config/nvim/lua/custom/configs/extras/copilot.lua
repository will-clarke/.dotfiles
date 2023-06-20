--- This will install copilot.lua and copilot
--- This should not be used in tandem with copilot-cmp module
--- The plugins are created by one of NvChad's member: zbirenbaum :D
--- For more information, read https://github.com/zbirenbaum/copilot.lua
--- Feel free to override the defaults of copilot.lua, using a spec, such as:
--- ```
--- {
---   "zbirenbaum/copilot.lua",
---   opts = function(_, opts --[[NvChad's default opts]])
---     -- Return the modified opts table
---   end,
--- }
--- ```



local options = {
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<M-j>",
      accept_word = false,
      accept_line = "<C-j>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
  server_opts_overrides = {},
}


---@type NvPluginSpec
local spec = {
  {
    "zbirenbaum/copilot.lua",
    event = { "InsertEnter" },
    cmd = { "Copilot" },
    opts = options,
  },
}

return spec
