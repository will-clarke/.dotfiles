local rest_ok, rest = pcall(require, "rest-nvim")
if not rest_ok then
	vim.notify("RestNvim not loaded", 3)
	return
end
vim.api.nvim_set_keymap("n", "r", rest.run, { desc = "HTTP run" })
vim.api.nvim_set_keymap("n", "l", rest.last, { desc = "HTTP last" })
