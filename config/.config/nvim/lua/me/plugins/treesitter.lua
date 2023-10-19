return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"windwp/nvim-ts-autotag",
		"nvim-treesitter/playground",
		"nvim-treesitter/nvim-treesitter-context",
	},
	config = function()
		local ok, treesitter = pcall(require, "nvim-treesitter.configs")
		if not ok then
			vim.notify("Treesitter not loaded", 3)
			return
		end

		treesitter.setup({
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"vimdoc",
				"dockerfile",
				"gitignore",
				"php",
				"go",
				"rust",
				"c",
				"astro",
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
			auto_install = true,
		})
	end,
}
