return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()
    end
    -- config = function()
    -- require("harpoon").setup({})
    -- end,
}
