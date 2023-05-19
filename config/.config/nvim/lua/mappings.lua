vim.g.mapleader = " "
vim.keymap.set("n", "-", ':NnnPicker<CR>', { desc = "NNN" })
-- vim.keymap.set("n", "<leader>-", ':NnnPicker %:p:h<CR>', { desc = "NNN local" })
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fs', ":w<CR>", { desc = "File save" })
vim.keymap.set('n', '<leader>fr', ":Telescope oldfiles<CR>", { desc = "Find Recent files" })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>ss', builtin.grep_string, { desc = "Search string" })
vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = "Buffers" })
vim.keymap.set('n', '<leader>bn', ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set('n', '<leader>bp', ":bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = "Help" })
vim.keymap.set("n", "<leader>lo", builtin.lsp_document_symbols, { desc = "SymbOls" })
vim.keymap.set("n", "<leader>lt", builtin.lsp_type_definitions, { desc = "Type" })
vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, { desc = "definitions" })
vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "references" })
vim.keymap.set("n", "<leader>li", builtin.lsp_implementations, { desc = "implementations" })
vim.keymap.set("n", "<leader>lO", builtin.lsp_dynamic_workspace_symbols, { desc = "workplace symbols" })
vim.keymap.set("n", "<leader>lci", builtin.lsp_incoming_calls, { desc = "incoming calls" })
vim.keymap.set("n", "<leader>lco", builtin.lsp_outgoing_calls, { desc = "outgoing calls" })
vim.keymap.set("n", "<leader>r", builtin.registers, { desc = "Registers" })

vim.keymap.set('n', '<leader><leader>', ':source $MYVIMRC<CR>', { desc = "Source Vimrc" })
vim.keymap.set('n', '<leader>v', ':e $MYVIMRC<CR>', { desc = "Vimrc" })

vim.keymap.set('n', '<space>F', function()
	vim.lsp.buf.format { async = true }
end, { desc = "Format" })

vim.keymap.set('n', '<leader>y', '"+y', { desc = "Yank" })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = "Yank Line" })
vim.keymap.set('v', '<leader>y', '"+y', { desc = "Yank" })
vim.keymap.set('n', '<leader>p', '"+p', { desc = "Paste" })

vim.keymap.set('n', '<leader>t', require("neotest").run.run, { desc = "Test" })


-- vim.keymap.set('n', '<space>d', function()
-- 	vim.diagnostic.open_float()
-- end, { desc="Line Diagnostics" })
-- vim.keymap.set('n', '<space>D', function()
-- 	vim.diagnostic.set_loclist()
-- end, { desc="Diagnostic List" })


vim.keymap.set("n", "<leader>g", ":Neogit<CR>", { desc = "Git" })


-- vim.keymap.set('n', '<leader>s', ":w<CR>", { desc = "Save" })
vim.keymap.set('n', '<leader>w', "<C-w>", { desc = "Window" })

vim.keymap.set('n', '<space>ca', function()
	vim.lsp.buf.code_action({ apply = true })
end, { desc = "Code Action" })


local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add Harpoon" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)


local telescope = require("telescope")
telescope.load_extension("undo")
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")



local wk = require("which-key")
wk.register({
	["<leader>f"] = { name = "+file" },
	["<leader>z"] = { name = "+lolz" },
})
