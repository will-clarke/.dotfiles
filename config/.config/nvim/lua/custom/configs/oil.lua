local spec = {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		win_options = {
			concealcursor = "nivc",
		},
		default_file_explorer = true,
		view_options = {
			-- show_hidden = true,
		},
		use_default_keymaps = false,
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["gv"] = "actions.select_vsplit",
			["<C-s>"] = false,
			["gs"] = "actions.select_split",
			["gt"] = "actions.select_tab",
			["<C-p>"] = "actions.preview",
			["<C-c>"] = "actions.close",
			["q"] = "actions.close",
			["<C-r>"] = "actions.refresh",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["~"] = "actions.tcd",
			["g."] = "actions.toggle_hidden",
		},
	},
	keys = { { ";", ":lua require('oil').open()<CR>" } },
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

return spec
