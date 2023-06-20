-- local autocmd = vim.api.nvim_create_autocmd

vim.opt.swapfile = false
vim.opt.backup = false

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- vim.cmd([[hi TreesitterContextBottom gui=underline guisp=Grey]])

vim.highlight.create("TreesitterContextBottom", { ctermbg = "Black", guibg = "Black" }, false)

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"checkhealth",
		"git",
		-- "oil",
		"neotest-output",
		"neotest-attach",
		"neotest-output-panel",
		"neotest-summary",
		"fugitive",
		"dap-float",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local yank_group = augroup("HighlightYank", {})
autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 60,
		})
	end,
})

local boo_whitespace = augroup("BooWhitespace", {})
autocmd({ "BufWritePre" }, {
	group = boo_whitespace,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_augroup("AutoFormatting", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.lua", "*.go" },
	group = "AutoFormatting",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
	vim.keymap.set("t", "<leader>w", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

vim.api.nvim_create_augroup("Git", {})
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "COMMIT_EDITMSG", "NeogitCommitMessage" },
	callback = function()
		vim.wo.spell = true
		vim.api.nvim_win_set_cursor(0, { 1, 0 })
		if vim.fn.getline(1) == "" then
			vim.cmd("startinsert!")
		end
	end,
	group = "Git",
})
