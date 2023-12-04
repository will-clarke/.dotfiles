return {
	"quarto-dev/quarto-nvim",
	lazy = false,
	dependencies = {
		"quarto-dev/quarto-nvim",
		"hrsh7th/nvim-cmp",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
		{
			"jmbuhr/otter.nvim",
			dev = false,
			dependencies = {
				{ "neovim/nvim-lspconfig" },
			},
			opts = {
				-- lsp = {
				-- 	hover = {
				-- 		-- border = require("misc.style").border,
				-- 	},
				-- },
				buffers = {
					-- if set to true, the filetype of the otterbuffers will be set.
					-- otherwise only the autocommand of lspconfig that attaches
					-- the language server will be executed without setting the filetype
					set_filetype = true,
				},
			},
		},
	},
	cmd = {
		"QuartoPreview",
		"QuartoClosePreview",
		"QuartoHelp",
		"QuartoActivate",
		"QuartoDiagnostics",
		"QuartoHover",
		"QuartoSend",
		"QuartoSendAbove",
		"QuartoSendBelow",
		"QuartoSendAll",
		"QuartoSendLine",
	},
	opts = {
		debug = false,
		closePreviewOnExit = true,
		lspFeatures = {
			enabled = true,
			languages = { "r", "python", "julia", "bash" },
			chunks = "curly", -- 'curly' or 'all'
			diagnostics = {
				enabled = true,
				triggers = { "BufWritePost" },
			},
			completion = {
				enabled = true,
			},
		},
		codeRunner = {
			enabled = true,
			default_method = "molten", -- 'molten' or 'slime'
			ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
			-- Takes precedence over `default_method`
			never_run = { "yaml" }, -- filetypes which are never sent to a code runner
		},
		keymap = {
			hover = "K",
			definition = "gd",
			rename = "<leader>lR",
			references = "gr",
		},
	},
}
