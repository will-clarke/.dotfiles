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
		{ "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", desc = "Zk New" },
		{ "<leader>zw", "<Cmd>ZkNew { group = 'work' }<CR>", desc = "Zk Work" },
		{ "<leader>zd", "<Cmd>ZkNew { group = 'diary' }<CR>", desc = "Zk Diary" },
		{ "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", desc = "Zk Open" },
		{ "<leader>zt", "<Cmd>ZkTags { sort = { 'note-count'} }<CR>", "Zk Tags", desc = "Zk Tags" },
	},
}
