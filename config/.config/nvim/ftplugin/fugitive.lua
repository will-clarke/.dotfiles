local function map(...)
	vim.api.nvim_buf_set_keymap(0, ...)
end
local opts = { noremap = true, silent = false }

map("n", "<tab>", ":normal =<CR>", opts)
map("n", "cn", ":<C-U>Git commit --no-verify<CR>", opts)
map("n", "p", ":<C-U>Git pull<CR>", opts)
map("n", "P", ":<C-U>Git push<CR>", opts)
