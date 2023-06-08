local function map(...) vim.api.nvim_buf_set_keymap(0, ...) end
local opts = { noremap = true, silent = false }

-- Open the link under the caret.
map("n", "<C-C><C-C>", "ZZ", opts)
