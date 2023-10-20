return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	after = "nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = "VeryLazy",
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["aa"] = "@attribute.outer",
						["ia"] = "@attribute.inner",
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },

						["ab"] = "@block.outer",
						["ib"] = "@block.inner",
						["ad"] = "@conditional.outer",
						["id"] = "@conditional.inner",
						["ao"] = "@loop.outer",
						["io"] = "@loop.inner",
						-- ["ap"] = "@parameter.outer",
						-- ["ip"] = "@parameter.inner",
						["a/"] = "@comment.outer",
						["ar"] = "@frame.outer",
						["ir"] = "@frame.inner",
						["at"] = "@attribute.outer",
						["it"] = "@attribute.inner",
						["as"] = "@statement.outer",
						["is"] = "@statement.outer",
					},
					-- You can choose the select mode (default is charwise 'v')
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * method: eg 'v' or 'o'
					-- and should return the mode ('v', 'V', or '<c-v>') or a table
					-- mapping query_strings to modes.
					-- selection_modes = {
					-- 	['@parameter.outer'] = 'v', -- charwise
					-- 	['@function.outer'] = 'V', -- linewise
					-- 	['@class.outer'] = '<c-v>', -- blockwise
					-- },
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]m"] = "@function.outer",
					["]f"] = "@call.outer",
					["]d"] = "@conditional.outer",
					["]o"] = "@loop.outer",
					["]s"] = "@statement.outer",
					["]a"] = "@parameter.outer",
					["]c"] = "@comment.outer",
					["]b"] = "@block.outer",
					["]l"] = { query = "@class.outer", desc = "next class start" },
					["]r"] = "@frame.outer",
					["]t"] = "@attribute.outer",
					["]e"] = "@scopename.outer",
					["]]m"] = "@function.inner",
					["]]f"] = "@call.inner",
					["]]d"] = "@conditional.inner",
					["]]o"] = "@loop.inner",
					["]]a"] = "@parameter.inner",
					["]]b"] = "@block.inner",
					["]]l"] = { query = "@class.inner", desc = "next class start" },
					["]]r"] = "@frame.inner",
					["]]t"] = "@attribute.inner",
					["]]e"] = "@scopename.inner",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]F"] = "@call.outer",
					["]D"] = "@conditional.outer",
					["]O"] = "@loop.outer",
					["]S"] = "@statement.outer",
					["]A"] = "@parameter.outer",
					["]C"] = "@comment.outer",
					["]B"] = "@block.outer",
					["]L"] = "@class.outer",
					["]R"] = "@frame.outer",
					["]T"] = "@attribute.outer",
					["]E"] = "@scopename.outer",
					["]]M"] = "@function.inner",
					["]]F"] = "@call.inner",
					["]]D"] = "@conditional.inner",
					["]]O"] = "@loop.inner",
					["]]A"] = "@parameter.inner",
					["]]B"] = "@block.inner",
					["]]L"] = "@class.inner",
					["]]R"] = "@frame.inner",
					["]]T"] = "@attribute.inner",
					["]]E"] = "@scopename.inner",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[F"] = "@call.outer",
					["[D"] = "@conditional.outer",
					["[O"] = "@loop.outer",
					["[S"] = "@statement.outer",
					["[A"] = "@parameter.outer",
					["[C"] = "@comment.outer",
					["[B"] = "@block.outer",
					["[L"] = "@class.outer",
					["[R"] = "@frame.outer",
					["[T"] = "@attribute.outer",
					["[E"] = "@scopename.outer",
					["[[M"] = "@function.inner",
					["[[F"] = "@call.inner",
					["[[D"] = "@conditional.inner",
					["[[O"] = "@loop.inner",
					["[[A"] = "@parameter.inner",
					["[[B"] = "@block.inner",
					["[[L"] = "@class.inner",
					["[[R"] = "@frame.inner",
					["[[T"] = "@attribute.inner",
					["[[E"] = "@scopename.inner",
				},
			},
		})
	end,
}
