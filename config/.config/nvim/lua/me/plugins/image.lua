return {
	"3rd/image.nvim",
	event = "VeryLazy",
	opts = {
		backend = "kitty",
		max_width = 100,
		max_height = 12,
		max_height_window_percentage = math.huge,
		max_width_window_percentage = math.huge,
		window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
		window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		integrations = {
			markdown = {
				enabled = true,
				clear_in_insert_mode = false,
				download_remote_images = true,
				only_render_image_at_cursor = false,
				filetypes = { "markdown", "vimwiki", "md", "quarto", "qmd" }, -- markdown extensions (ie. quarto) can go here
			},
			neorg = {
				enabled = true,
				clear_in_insert_mode = false,
				download_remote_images = true,
				only_render_image_at_cursor = false,
				filetypes = { "norg" },
			},
		},
		-- max_width = nil,
		-- max_height = nil,
		-- max_width_window_percentage = nil,
		-- max_height_window_percentage = 50,
		kitty_method = "normal",
	},
}
