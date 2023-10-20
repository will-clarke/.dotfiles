return {
	"mickael-menu/zk-nvim",
	config = function()
		require("zk").setup({
			picker = "telescope",

			lsp = {
				config = {
					cmd = { "zk", "lsp" },
					name = "zk",
				},
				auto_attach = {
					enabled = true,
					filetypes = { "markdown" },
				},
			},
		})
	end,
	cmd = { "ZkNew", "ZkNotes", "ZkTags" },
	keys = {
		{ "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", "Zk New" },
		{ "<leader>zw", "<Cmd>ZkNew { group = 'work' }<CR>", "Zk Work" },
		{ "<leader>zd", "<Cmd>ZkNew { group = 'diary' }<CR>", "Zk Diary" },
		{ "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", "Zk Open" },
		{ "<leader>zt", "<Cmd>ZkTags<CR>", "Zk Tags" },
	},
}
