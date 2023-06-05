local function map(...) vim.api.nvim_buf_set_keymap(0, ...) end
local opts = { noremap = true, silent = false }

map("n", "<tab>", ":normal =<CR>", opts)
