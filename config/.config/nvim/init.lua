require("me")
-- ./lua/me/init.lua
-- ./lua/me/plugins/
-- ./lua/me/plugins/git.lua

local wk_ok, wk = pcall(require, "which-key")

vim.api.nvim_create_user_command("CopyBufferPath", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify("Copied: " .. path)
end, {})

if wk_ok then
	wk.register({
		gd = { "<cmd>Telescope lsp_definitions<CR>", "definition" },
		gr = { "<cmd>Telescope lsp_references<CR>", "references" },
		gi = { "<cmd>Telescope lsp_implementations<CR>", "implementations" },
		["<c-n>"] = { "<Plug>(YankyCycleBackward)", "yank backward" },
		["<c-p>"] = { "<Plug>(YankyCycleForward)", "yank forward" },
		p = { "<Plug>(YankyPutAfter)", "put after" },
		P = { "<Plug>(YankyPutBefore)", "put before" },
		gp = { "<Plug>(YankyGPutAfter)", "gput after" },
		gP = { "<Plug>(YankyGPutBefore)", "gput before" },
		["]d"] = { vim.diagnostic.goto_next, "next diagnostic" },
		["[d"] = { vim.diagnostic.goto_prev, "previous diagnostic" },
		["]b"] = { ":bnext<CR>", "bnext" },
		["[b"] = { ":bprevious<CR>", "bprevious" },
		["]a"] = { ":next<CR>", "next" },
		["[a"] = { ":previous<CR>", "previous" },
		["]q"] = { ":cnext<CR>", "cnext" },
		["[q"] = { ":cprevious<CR>", "cprevious" },
		["]x"] = { "<Plug>(git-conflict-next-conflict)", "next conflict" },
		["[x"] = { "<Plug>(git-conflict-prev-conflict)", "prev conflict" },
		["]f"] = {
			function()
				editNextFile(1)
			end,
			"next file",
		},
		["[f"] = {
			function()
				editNextFile(-1)
			end,
			"previous file",
		},
		K = { vim.lsp.buf.hover, "hover" },

		["<leader>"] = {
			["?"] = { "<CMD>Telescope keymaps<CR>", "keymaps" },
			["<CR>"] = { "<CMD>Make<CR>", "make" },
			[" "] = { ":Telescope frecency workspace=CWD<CR>", "Telescope frequency workspace=CWD" },
			["/"] = { ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Search text" },
			["."] = {
				":lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor({postfix='',quote=false})<CR>",
				"grep word",
			},
			[";"] = { ":Telescope resume<CR>", "resume" },
			y = { ":CopyBufferPath<CR>", "copy buffer path" },
			p = { ":Telescope yank_history<CR>", "paste history" },
			e = { ":Telescope diagnostics<CR>", "diagnostics / errors" },
			v = { ":lua Toggle_venn()<CR>", "Venn - Drawing!" },
			b = { ":Telescope buffers<CR>", "buffers" },
			o = { "<Plug>SnipRun", "SnipRun" },
			O = { "<Plug>SnipRunOperator", "SnipRunOperator" },
			q = { "<CMD>copen<CR>", "quickfix" },
			n = { ":enew<CR>", "cnext" },
			m = { ":cnext<CR>", "cnext" },
			J = { ":TSJToggle<CR>", "Join toggle" },
			[","] = { ":cprev<CR>", "cprev" },
			s = { ":lua require('harpoon.ui').toggle_quick_menu()<CR>", "harpoon" },
			a = { ":lua require('harpoon.mark').add_file()<CR>", "add harpoon" },
			j = { ':lua require("harpoon.ui").nav_file(1)<CR>', "harpoon #1" },
			h = { ':lua require("harpoon.ui").nav_file(3)<CR>', "harpoon #3" },
			k = { ':lua require("harpoon.ui").nav_file(2)<CR>', "harpoon #2" },
			c = { ":e ~/.config/nvim/init.lua<CR>", "config" },
			["'"] = { ':lua require("harpoon.term").gotoTerminal(1)<CR>', "harpoon term" },
			r = {
				function()
					local buf = vim.api.nvim_get_current_buf()
					local ft = vim.api.nvim_buf_get_option(buf, "filetype")
					if ft == "http" then
						local rest_ok, rest = pcall(require, "rest-nvim")
						if not rest_ok then
							vim.notify("RestNvim not loaded", 3)
							return
						end
						rest.run()
					else
						require("telescope.builtin").oldfiles()
					end
				end,
				"do something",
			},
			l = {
				name = "LSP",
				a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "codea action" },
				f = { "<cmd>lua vim.lsp.buf.format()<CR>", "format" },
				r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename" },
				w = { "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "workspace symbol" },
				p = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "previous diagnostic" },
				n = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "next diagnostic" },
				o = { "<cmd>Telescope lsp_document_symbols<CR>", "outline" },
				d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "diagnostic" },
				D = {
					function()
						local bufnr = vim.api.nvim_get_current_buf()
						require("telescope.builtin").diagnostics({ bufnr = bufnr })
					end,
					"LSP show buffer diagnostics",
				},
			},
			t = {
				t = { "<cmd>lua require('neotest').run.run({path, extra_args = {'-race'}})<CR>", "test" },
				f = { "<CMD>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "test file" },
				a = { "<CMD>lua require('neotest').run.attach()<CR>", "attach" },
				o = { "<CMD>lua require('neotest').output_panel.toggle()<CR>", "output" },
				O = { "<CMD>lua require('neotest').output.open({ enter = true })<CR>", "Output" },
				s = { "<CMD>lua require('neotest').summary.toggle()<CR>", "summary" },
				l = { "<CMD>lua require('neotest').run.run_last()<CR>", "last" },
				-- d = { "<CMD>lua require('neotest').run.run({strategy = 'dap'})<CR>", "dap" },
				d = { "<CMD>lua require('dap-go').debug_test()<CR>", "debug test" },
				D = { "<CMD>lua require('dap-go').debug_last_test()<CR>", "debug last test" },
			},
			d = {
				c = { "<CMD>lua require('dap').continue()<CR>", "continue" },
				i = { "<CMD>lua require('dap').step_into()<CR>", "step into" },
				s = { "<CMD>lua require('dap').step_over()<CR>", "step over" },
				o = { "<CMD>lua require('dap').step_out()<CR>", "step out" },
				b = { "<CMD>lua require('dap').toggle_breakpoint()<CR>", "toggle breakpoint" },
				B = { "<CMD>lua require('dap').set_breakpoint()<CR>", "set breakpoint" },
				L = {
					"<CMD>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
					"log point",
				},
				r = { "<CMD>lua require('dap').repl.open()<CR>", "repl" },
				l = { "<CMD>lua require('dap').run_last()<CR>", "run last" },
				K = { "<CMD>lua require('dap.ui.widgets').hover()<CR>", "hover" },
				p = { "<CMD>lua require('dap.ui.widgets').preview()<CR>", "preview" },
				f = {
					"<CMD>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').widgets.frames)<CR>",
					"frames",
				},
				X = {
					"<CMD>lua require('dap').disconnect({ terminateDebuggee = true }); require('dap').close()<CR>",
					"exit",
				},
				S = {
					"<CMD>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)<CR>",
					"scopes",
				},
			},
			g = {
				-- g = { "<CMD>Neogit<CR>", "git" },
				g = { "<CMD>Git<CR>", "git" },
				l = {
					"<CMD>Git log --pretty='%h %cd [%aN%d] %s' --graph --date=relative --date-order<CR>",
					"git log",
				},
				p = { "<CMD>Git pull<CR>", "git" },
				P = { "<CMD>Git push<CR>", "git" },
				b = { "<CMD>GitBlameToggle<CR>", "git blame" },
				y = { "<CMD>GitBlameCopyFileURL<CR>", "yank" },
				t = { "<CMD>0GlLog<CR>", "time machine" },
			},
			N = {
				'<CMD>execute "set number!" | echo "Line numbers are now " . ( &number ? "enabled" : "disabled" )',
				"number toggle",
			},
			W = {
				"<CMD>execute 'set wrap!' | echo 'Wrap is now ' . ( &wrap ? 'enabled' : 'disabled' )<CR>",
				"wrap",
			},
			w = { "<CMD>w<CR>", "write" },
			f = {
				name = "Find",
				f = { "<cmd>Telescope find_files<cr>", "Find File" },
				r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false },
				n = { "<cmd>e tmp<cr>", "New File" }, -- just a label. don't create any mapping
			},
		},
		["["] = {
			h = {
				function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						local gs = require("gitsigns")
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end,
				{ expr = true },
				"prev hunk",
			},
		},
		["]"] = {
			h = {
				function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						local gs = require("gitsigns")
						gs.next_hunk()
					end)
					return "<Ignore>"
				end,
				{ expr = true },
				"next hunk",
			},
		},
	})
	-- text objects
	wk.register({
		ae = { ":<C-u>norm! mzggVG<CR>", "Entire buffer text object" },
		ie = { ":<C-u>norm! mzggVG<CR>", "Entire buffer text object" },
		al = { ":<C-u>norm! 0v$<cr>", "around line" },
		il = { ":<C-u>norm! _vg_<cr>", "in line" },
		ih = { ":<C-U>Gitsigns select_hunk<CR>", "in hunk" },
	}, { prefix = "", mode = "o" })
	-- visual mode
	wk.register({
		o = { "<Plug>SnipRun", "SnipRun" },
		["<leader>"] = {
			["."] = {
				":lua require('telescope-live-grep-args.shortcuts').grep_visual_selection()<CR>",
				"grep word",
			},
		},
	}, { mode = "v" })
end

-- autocmds {{{
local aucmd_dict = {
	TextYankPost = {
		{
			pattern = "*",
			callback = function()
				vim.highlight.on_yank({ higroup = "IncSearch", timeout = 120 })
			end,
		},
	},
	BufWinEnter = {
		{
			pattern = "COMMIT_EDITMSG,NeogitCommitMessage",
			callback = function()
				if vim.fn.getline(1) == "" then
					vim.cmd("startinsert")
				end
			end,
		},
	},
	BufWritePre = {
		{
			pattern = "*.lua",
			callback = function()
				vim.lsp.buf.format()
			end,
		},
		{
			pattern = "*.go",
			callback = function()
				vim.lsp.buf.format()
				vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
			end,
		},
	},
	FileType = {
		{
			pattern = "markdown,txt",
			callback = function()
				-- vim.api.nvim_win_set_option(0, "spell", true)
			end,
		},
		{
			pattern = "help,lspinfo,man,git,neotest-*,dap-float,qf,messages,httpResult,startuptime,fugitive",
			callback = function()
				vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
			end,
		},
	},
	User = {
		{
			pattern = "GitConflictDetected",
			callback = function()
				vim.notify("Conflict detected!!")
			end,
		},
	},
}

-- vim.api.nvim_create_autocmd("BufRead", {
-- 	pattern = "*.http",
-- 	callback = function(opts)
-- 		vim.bo.filetype = "http"
-- 	end,
-- })

for event, opt_tbls in pairs(aucmd_dict) do
	for _, opt_tbl in pairs(opt_tbls) do
		vim.api.nvim_create_autocmd(event, opt_tbl)
	end
end
-- }}}

-- vim.api.nvim_create_autocmd("BufRead", {
-- 	pattern = "*.http",
-- 	callback = function(opts)
-- 		vim.bo.filetype = "http"
-- 	end,
-- })

for event, opt_tbls in pairs(aucmd_dict) do
	for _, opt_tbl in pairs(opt_tbls) do
		vim.api.nvim_create_autocmd(event, opt_tbl)
	end
end
-- }}}
