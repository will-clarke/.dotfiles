local env = vim.env

local options = {
	opt = { -- opt scope
		-- guicursor = "",
		guifont = "*",

		cmdheight = 1,

		shell = env.SHELL,

		number = true,
		relativenumber = false,

		tabstop = 4,
		softtabstop = 4,
		shiftwidth = 4,
		expandtab = true,

		smartindent = true,
		autoindent = true,

		smartcase = true,
		ignorecase = true,

		wrap = false,

		swapfile = false,
		backup = false,
		undodir = os.getenv("HOME") .. "/.vim/undodir",
		undofile = true,

		hlsearch = true,
		incsearch = true,

		termguicolors = true,

		scrolloff = 5,
		signcolumn = "yes",

		winblend = 0,

		updatetime = 50,

		-- colorcolumn = "80",
		-- showmode = false,
		-- cursorline = true,
	},
	g = { -- global scope
		-- netrw_banner = false,
		-- netrw_browse_split = 0,
		-- netrw_winsize = 25,
		-- netrw_list_hide = "node_modules",

		gitblame_enabled = false,
		mapleader = " ",
		colorscheme = "catppuccin",
		transparency = true,
	},
}

local set_options = function(options_table)
	for scope, opts in pairs(options_table) do
		for opt, value in pairs(opts) do
			vim[scope][opt] = value
		end
	end
end

set_options(options)

vim.api.nvim_set_option("clipboard", "unnamed")

vim.opt.isfname:append("@-@")

-- add binaries installed by mason.nvim to path
vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath("data") .. "/mason/bin"
