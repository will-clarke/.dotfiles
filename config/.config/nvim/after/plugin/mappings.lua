-- vnoremap <leader>p "_dP
-- nnoremap <Leader>ln :lnext<CR>
-- nnoremap <Leader>lp :lprev<CR>
-- nnoremap <Leader>ll :llist<CR>

vim.g.mapleader = " "

-- vim.keymap.set('n', '<C-w>o', ":mksession! ~/.config/nvim/session.vim<CR>:wincmd o<CR>",
--     { noremap = true, desc = "Only window" })
-- vim.keymap.set('n', '<C-w>u', ":source ~/.config/nvim/session.vim<CR>", { noremap = true, desc = "Undo session" })

vim.keymap.set('n', '<leader>w', "<C-w>", { desc = "Window" })
vim.keymap.set('n', '<leader>wo', ":mksession! ~/.config/nvim/session.vim<CR>:wincmd o<CR>",
    { noremap = true, desc = "Only window" })
vim.keymap.set('n', '<leader>wu', ":source ~/.config/nvim/session.vim<CR>", { noremap = true, desc = "Undo session" })



vim.keymap.set("n", ";", require("oil").open, { desc = "Oil" })

-- Text objects!!!!
-- l = line
-- e = entire buffer
vim.keymap.set({ "x", "o" }, "al", ":<C-u>norm! 0v$<cr>", { desc = "Line text object" })
vim.keymap.set({ "x", "o" }, "il", ":<C-u>norm! _vg_<cr>", { desc = "Line text object" })

vim.keymap.set({ "x", "o" }, "ae", ":<C-u>norm! mzggVG<CR>", { desc = "Entire buffer text object" })
vim.keymap.set({ "x", "o" }, "ie", ":<C-u>norm! mzggVG<CR>", { desc = "Entire buffer text object" })

vim.keymap.set("n", "<leader>qq", ":wq<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>qQ", ":qa!<CR>", { desc = "Quit ALL NOW" })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fF', builtin.fd, { desc = "Find files from CWD" })
vim.keymap.set('n', '<leader>fs', ":w<CR>", { desc = "File save" })
vim.keymap.set('n', '<leader>fr', ":Telescope oldfiles<CR>", { desc = "Find Recent files" })
vim.keymap.set('n', '<leader>ss', builtin.live_grep, { desc = "Search project" })
vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = "Search project" })
vim.keymap.set('n', "<leader>'", builtin.resume, { desc = "resume" })
vim.keymap.set('n', '<leader>sS', builtin.current_buffer_fuzzy_find, { desc = "Search buffer" })

vim.keymap.set('n', '<leader>k', builtin.keymaps, { desc = "Keymaps" })

vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = "Search word" })
vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = "Buffers" })
vim.keymap.set('n', '<leader>bn', ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set('n', '<leader>bp', ":bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set('n', '<leader>bd', ":bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set('n', '<leader>ht', builtin.help_tags, { desc = "Help" })
vim.keymap.set("n", "<leader>lo", builtin.lsp_document_symbols, { desc = "SymbOls" })
vim.keymap.set("n", "<leader>lt", builtin.lsp_type_definitions, { desc = "Type" })
vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, { desc = "definitions" })
vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "references" })
vim.keymap.set("n", "<leader>li", builtin.lsp_implementations, { desc = "implementations" })
vim.keymap.set("n", "<leader>lO", builtin.lsp_dynamic_workspace_symbols, { desc = "workplace symbols" })
vim.keymap.set("n", "<leader>lci", builtin.lsp_incoming_calls, { desc = "incoming calls" })
vim.keymap.set("n", "<leader>lco", builtin.lsp_outgoing_calls, { desc = "outgoing calls" })
vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, { desc = "rename variable" })
vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "definitions" })
vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "references" })
vim.keymap.set("n", "<leader>y", ":Telescope neoclip<CR>", { desc = "Yank ring" })
--  maybe also look in after/plugin/telescope.lua

vim.keymap.set('n', '<leader><space>', builtin.find_files, { desc = "Find files" })

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xn", function() require("trouble").next({ skip_groups = true, jump = true }); end,
    { silent = true, noremap = true, desc = "next" })
vim.keymap.set("n", "<leader>xp", function() require("trouble").previous({ skip_groups = true, jump = true }); end,
    { silent = true, noremap = true, desc = "previous" })
vim.keymap.set("n", "]x", function() require("trouble").next({ skip_groups = true, jump = true }); end,
    { silent = true, noremap = true, desc = "next" })
vim.keymap.set("n", "[x", function() require("trouble").previous({ skip_groups = true, jump = true }); end,
    { silent = true, noremap = true, desc = "previous" })


vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

-- vim.keymap.set("n", "<leader>R", builtin.registers, { desc = "Registers" })
vim.keymap.set("n", "<leader>r", builtin.resume, { desc = "resume" })

vim.keymap.set('n', '<Leader>R', require("replacer").run, { desc = "Replacer" })

-- vim.keymap.set('n', '<leader><leader>', ':source $MYVIMRC<CR>', { desc = "Source Vimrc" })
vim.keymap.set('n', '<leader>v', ':e $MYVIMRC<CR>', { desc = "Vimrc" })
vim.keymap.set('n', '<leader>V', ':e ~/.config/nvim/after/plugin/mappings.lua<CR>', { desc = "Vimrc" })

vim.keymap.set('n', '<leader>=', function()
    vim.lsp.buf.format { async = true }
end, { desc = "Format" })

-- vim.keymap.set('n', '<leader>tl', require("neotest").run.last, { desc = "last" })
vim.keymap.set('n', '<leader>tr', function()
    require("neotest").summary.open()
    require("neotest").run.run()
end, { desc = "Test" })
vim.keymap.set('n', '<leader>tf', function()
    require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Test file" })
vim.keymap.set('n', '<leader>td', function()
    require("neotest").run.run({ strategy = "dap" })
end, { desc = "Debug" })
vim.keymap.set('n', '<leader>ta', require("neotest").run.attach, { desc = "Attach to test" })
vim.keymap.set('n', '<leader>to', require("neotest").output_panel.toggle, { desc = "Output toggle" })
vim.keymap.set('n', '<leader>tO',
    function()
        require("neotest").output.open({ enter = true })
    end
    , { desc = "Output open" })

vim.keymap.set('n', '<leader>ts', require("neotest").summary.toggle, { desc = "Summary of test" })
vim.keymap.set('n', '<leader>n', ":e ~/notes/work/" .. os.date('%Y-%m-%d') .. ".md<CR>", { desc = "Notes" })
vim.keymap.set('n', '<leader>NN', ":e ~/notes/diary/" .. os.date('%Y-%m-%d') .. ".md<CR>", { desc = "Journal" })
vim.keymap.set('n', '<leader>T', ":e ~/notes/TODO.md<CR>", { desc = "TODO" })

-- vim.keymap.set('n', '<space>d', function()
-- 	vim.diagnostic.open_float()
-- end, { desc="Line Diagnostics" })
-- vim.keymap.set('n', '<space>D', function()
-- 	vim.diagnostic.set_loclist()
-- end, { desc="Diagnostic List" })


vim.keymap.set("n", "<leader>gg", ":Git<CR>", { desc = "Git" })
vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git" })
vim.keymap.set("n", "<leader>gw", ":Gwrite<CR>", { desc = "Git Write" })
vim.keymap.set("n", "<leader>gr", ":Gread<CR>", { desc = "Git Read" })
vim.keymap.set("n", "<leader>gp", ":Git pull<CR>", { desc = "Git pull" })
vim.keymap.set("n", "<leader>gP", ":Git push<CR>", { desc = "Git push" })
vim.keymap.set("n", "<leader>gco", ":Git checkout", { desc = "Git checkout" })
vim.keymap.set("n", "<leader>gL", ":GetCommitLink<CR>", { desc = "Git Link" })
vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "Git log" })
vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "Git blame" })

-- nnoremap <Leader>gs :G<CR>
-- nnoremap <Leader>gc :Git commit<CR>
-- nnoremap <Leader>ga :Gwrite<CR>
-- nnoremap <Leader>gk :Gread<CR>
-- " nnoremap <Leader>gl :GV<CR>
-- nnoremap <Leader>gp :Git push<CR>
-- nnoremap <Leader>gf :diffget //2<CR>
-- nnoremap <Leader>gj :diffget //3<CR>


-- vim.keymap.set('n', '<leader>s', ":w<CR>", { desc = "Save" })

vim.keymap.set('n', '<space>ca', function()
    vim.lsp.buf.code_action({ apply = true })
end, { desc = "Code Action" })
vim.keymap.set('n', '<space>la', function()
    vim.lsp.buf.code_action({ apply = true })
end, { desc = "Code Action" })


-- vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
-- vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)


-- local telescope = require("telescope")
-- telescope.load_extension("undo")
-- vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>tn", ":set number!<CR>", { desc = "set number!" })

local toggle_theme = function()
    local themes = {
        -- "tokyonight",
        "tokyonight-night",
        -- "tokyonight-moon",
        "tokyonight-day",
    }
    local current_theme = vim.g.colors_name
    local next_theme_idx = 1
    for k, v in pairs(themes) do
        if current_theme == v then
            next_theme_idx = k
        end
    end

    next_theme_idx = next_theme_idx % #themes + 1

    local next_theme = themes[next_theme_idx]

    vim.cmd('colorscheme ' .. next_theme)
    vim.g.colors_name = next_theme

    print("setting theme to " .. next_theme)
end
vim.keymap.set("n", "<leader>tT", toggle_theme, { desc = "toggle theme" })

vim.cmd [[colorscheme tokyonight]]


local wk = require("which-key")
wk.register({ ["<leader>f"] = { name = "+file" } })


-- save
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<ESC>:w<CR>i")

-- -- moving lines up and down
-- GETS OVERWRITTEN OMG
vim.keymap.set("n", "<M-J>", ":m .+1<CR>==")
vim.keymap.set("n", "<M-K>", ":m .-3<CR>==")
vim.keymap.set("v", "<M-J>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-K>", ":m '<-2<CR>gv=gv")

-- indenting blocks visually
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

local readline = require 'readline'
vim.keymap.set('!', '<M-f>', readline.forward_word)
vim.keymap.set('!', '<M-b>', readline.backward_word)
vim.keymap.set('!', '<C-a>', readline.beginning_of_line)
vim.keymap.set('!', '<C-e>', readline.end_of_line)
vim.keymap.set('!', '<M-d>', readline.kill_word)
vim.keymap.set('!', '<M-BS>', readline.backward_kill_word)
vim.keymap.set('!', '<C-w>', readline.unix_word_rubout)
vim.keymap.set('!', '<C-k>', readline.kill_line)
vim.keymap.set('!', '<C-u>', readline.backward_kill_line)
vim.keymap.set('!', '<C-f>', '<Right>')
vim.keymap.set('!', '<C-b>', '<Left>')
vim.keymap.set('!', '<C-p>', '<Up>')
vim.keymap.set('!', '<C-d>', '<Delete>') -- delete-char
vim.keymap.set('!', '<C-n>', '<Down>')
vim.keymap.set('!', '<C-h>', '<BS>')     -- backward-delete-char

vim.keymap.set("n", "<leader>m", require('treesj').toggle, { desc = "Split/Join" })


local opts = { noremap = true, silent = false }

-- !!!MORE ZK MAPPINGS IN ftplugin/markdown.lua!!!
-- Create a new note after asking for its title.
vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>zw", "<Cmd>ZkNew { group = 'work' }<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>zd", "<Cmd>ZkNew { group = 'diary' }<CR>", opts)

-- Open notes.
vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
-- Open notes associated with the selected tags.
vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)

-- Search for the notes matching a given query.
vim.api.nvim_set_keymap("n", "<leader>zf",
    "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", opts)


-- !!!MORE ZK MAPPINGS IN ftplugin/markdown.lua!!!
--
--
vim.keymap.set('n', '<leader>dt', require('dap-go').debug_test, { desc = "test (go)" })
vim.keymap.set('n', '<leader>dc', require('dap').continue, { desc = "continue / START!" })
vim.keymap.set('n', '<leader>ds', require('dap').step_over, { desc = "Step over " })
vim.keymap.set('n', '<leader>di', require('dap').step_into, { desc = "step In" })
vim.keymap.set('n', '<leader>do', require('dap').step_out, { desc = "step Out" })
vim.keymap.set('n', '<Leader>db', require('dap').toggle_breakpoint, { desc = "breakpoint" })
-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>dm',
    function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = "message??" })
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, { desc = "repl" })
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = "last run" })
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end, { desc = "hover" })
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end, { desc = "preview" })
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end, { desc = "frames" })
vim.keymap.set('n', '<Leader>dS', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end, { desc = "scopes" })


vim.keymap.set('n', '<Leader>du', function() require('dapui').toggle() end, { desc = "UI toggle" })

vim.keymap.set('n', '<Leader>qr', require("replacer").run, { silent = true, desc = "quickfix replacer" })

-- GEt this working
-- nnoremap <silent>[n <cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>
-- nnoremap <silent>]n <cmd>lua require("neotest").jump.next({ status = "failed" })<CR>
--
vim.keymap.set({ 'n', 't' }, '<A-h>', '<CMD>KittyNavigateLeft<CR>')
vim.keymap.set({ 'n', 't' }, '<A-l>', '<CMD>KittyNavigateRight<CR>')
vim.keymap.set({ 'n', 't' }, '<A-k>', '<CMD>KittyNavigateUp<CR>')
vim.keymap.set({ 'n', 't' }, '<A-j>', '<CMD>KittyNavigateDown<CR>')
vim.keymap.set({ 'n', 't' }, '<A-p>', '<CMD>KittyNavigatePrevious<CR>')

vim.keymap.set('n', '<M-H>', require('smart-splits').resize_left)
vim.keymap.set('n', '<M-J>', require('smart-splits').resize_down)
vim.keymap.set('n', '<M-K>', require('smart-splits').resize_up)
vim.keymap.set('n', '<M-L>', require('smart-splits').resize_right)


vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- local function cmd(command)
--     return table.concat({ '<Cmd>', command, '<CR>' })
-- end

vim.keymap.set('n', '<leader><CR>', ":ToggleTerm<CR>", { desc = "Toggle term" })

vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleBackward)")

local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
end

local gs = require('gitsigns')
-- package.loaded.gitsigns

-- Navigation
map('n', ']c', function()
    if vim.wo.diff then return ']c' end
    vim.schedule(function() gs.next_hunk() end)
    return '<Ignore>'
end, { expr = true, desc = "Next hunk" })

map('n', '[c', function()
    if vim.wo.diff then return '[c' end
    vim.schedule(function() gs.prev_hunk() end)
    return '<Ignore>'
end, { expr = true, desc = "Previous hunk" })

-- Actions
map('n', '<leader>hs', gs.stage_hunk, { desc = "stage hunk" })
map('n', '<leader>hr', gs.reset_hunk, { desc = "reset hunk" })
map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end, { desc = "stage hunk" })
map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end, { desc = "reset hunk" })
map('n', '<leader>hS', gs.stage_buffer, { desc = "stage buffer" })
map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "undo stage hunk" })
map('n', '<leader>hR', gs.reset_buffer, { desc = "reset buffer" })
map('n', '<leader>hp', gs.preview_hunk, { desc = "preview hunk" })
map('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = "blame" })
map('n', '<leader>hB', gs.toggle_current_line_blame, { desc = "toggle blame on current line" })
map('n', '<leader>hd', gs.diffthis, { desc = "diff" })
map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "diff ~" })
map('n', '<leader>hT', gs.toggle_deleted, { desc = "toggle deleted" })

-- Text object
map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
