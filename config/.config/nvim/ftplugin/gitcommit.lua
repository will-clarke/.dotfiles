local function map(...) vim.api.nvim_buf_set_keymap(0, ...) end
local opts = { noremap = true, silent = false }

-- commit a la magit
map("n", "<C-C><C-C>", "ZZ", opts)
map("i", "<C-C><C-C>", "<C-o>ZZ", opts)
