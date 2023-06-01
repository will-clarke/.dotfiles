local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
    extensions = {
        undo = {},
        neoclip = {},
    },
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
    },
})

-- telescope.load_extension('neoclip')
