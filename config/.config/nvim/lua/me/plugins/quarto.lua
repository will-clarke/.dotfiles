return {
	"quarto-dev/quarto-nvim",
	dependencies = {
		"quarto-dev/quarto-nvim",
		"jmbuhr/otter.nvim",
		"hrsh7th/nvim-cmp",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
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
			enabled = false,
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
