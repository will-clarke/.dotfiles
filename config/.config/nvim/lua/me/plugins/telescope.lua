return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-frecency.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	event = "VeryLazy",
	config = function()
		local ok, telescope = pcall(require, "telescope")
		if not ok then
			vim.notify("Telescope not loaded", 3)
			return
		end

		local lga_ok, lga_actions = pcall(require, "telescope-live-grep-args.actions")
		if not lga_ok then
			vim.notify("Live grep telescope not loaded", 3)
			return
		end

		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				-- wrap_results = true,
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-t>"] = actions.select_tab,
						["<esc>"] = actions.close,
						["<C-w>"] = actions.send_selected_to_qflist,
						["<C-q>"] = actions.send_to_qflist,
					},
					n = {
						["q"] = actions.close,
					},
				},
				file_ignore_patterns = {
					"node_modules/",
					"%.git/",
					"%.DS_Store$",
					"target/",
					"build/",
					"%.o$",
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
				},
				layout_config = {
					-- prompt_position = "top",
					horizontal = {
						width = 0.99,
						-- width_padding = 0.1,
						-- height_padding = 0.1,
						-- preview_width = 0.6,
					},
					vertical = {
						height = 0.99,
						-- width_padding = 0.1,
						-- height_padding = 0.1,
						-- preview_height = 0.5,
					},
				},
				-- path_display = { "smart" },
				-- -- prompt_position = "top",
				-- prompt_prefix = " 󰍉 ",
				-- selection_caret = "  ",
				-- -- sorting_strategy = "ascending",
				-- winblend = 0,
				-- set_env = { ["COLORTERM"] = "truecolor" },
				-- border = {},
				-- borderchars = {
				-- 	"─",
				-- 	"│",
				-- 	"─",
				-- 	"│",
				-- 	"╭",
				-- 	"╮",
				-- 	"╯",
				-- 	"╰",
				-- },
				-- color_devicons = true,
			},
			pickers = {
				colorscheme = {
					prompt_prefix = " 󰏘 ",
				},
				find_files = {
					prompt_prefix = " 󰈔 ",
					find_command = { "rg", "--files", "--hidden" },
				},
				git_files = {
					prompt_prefix = " 󰊢 ",
					show_untracked = true,
				},
				keymaps = {
					prompt_prefix = " 󰌌 ",
				},
				commands = {
					prompt_prefix = "  ",
				},
				help_tags = {
					prompt_prefix = " 󰞋 ",
				},
				grep_string = {
					prompt_prefix = " 󰬶 ",
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
				frecency = {
					db_validate_threshold = 200,
					auto_validate = true,
				},
				live_grep_args = {
					auto_quoting = true,
					mappings = {
						i = {
							["<C-y>"] = lga_actions.quote_prompt(),
							["<C-v>"] = lga_actions.quote_prompt({ postfix = " -g!vendor " }),
							["<C-t>"] = lga_actions.quote_prompt({ postfix = " -g!vendor -g!*_test.go -g!*.gen.go" }),
							["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
						},
					},
				},
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
			},
		})

		telescope.load_extension("harpoon")
		telescope.load_extension("frecency")
		telescope.load_extension("ui-select")
		telescope.load_extension("yank_history")
	end,
}
