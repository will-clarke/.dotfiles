return {
	"GCBallesteros/jupytext.nvim",
	branch = "support-more-than-just-auto",
	config = true,
	opts = {
		style = "markdown",
		custom_language_formatting = {
			-- py = { extension = "md", style = "light" },
			-- ipynb = { extension = "md", style = "light" },
			python = { extension = "md", style = "light" },
		},
	},
	ft = { "*.py", "*ipynb" },
	lazy = false,
}
