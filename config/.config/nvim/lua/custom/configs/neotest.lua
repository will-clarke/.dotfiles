local spec = {
	"nvim-neotest/neotest",

	keys = {
		{ "<leader>tt", ":lua require('neotest').run.run()<CR>", "test" },
		{ "<leader>tf", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "test file" },
		{ "<leader>td", ":lua require('neotest').run.run({strategy = 'dap'})<CR>", "test debug" },
		{ "<leader>tS", ":lua require('neotest').run.stop()<CR>", "test stop" },
		{ "<leader>ta", ":lua require('neotest').run.attach()<CR>", "test attach" },
		{
			"<leader>tl",
			function()
				require("neotest").run.run_last()
			end,
			"test last",
		},
		{ "<leader>ts", ":lua require('neotest').summary.toggle()<CR>", "test summary" },
		{ "<leader>to", ":lua require('neotest').output.open({enter = true})<CR>", "test output" },
		{ "<leader>tO", ":lua require('neotest').output_panel.toggle()<CR>", "test output panel" },
		-- require("neotest").summary.toggle()
		--require("neotest").output.open({ enter = true })
		--require("neotest").output_panel.toggle()
	},

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-go",
	},

	config = function()
		require("neotest").setup({

			floating = {
				border = "rounded",
				max_height = 0.95,
				max_width = 0.95,
			},
			adapters = {

				require("neotest-go")({
					experimental = {
						test_table = true,
					},
					args = { "-count=1", "-timeout=60s" },
				}),
			},
		})
	end,
}

return spec
