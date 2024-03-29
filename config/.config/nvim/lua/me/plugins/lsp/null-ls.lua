return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- import null-ls plugin
		local ok, null_ls = pcall(require, "null-ls")
		if not ok then
			vim.notify("Null-ls is not loaded", 3)
			return
		end

		local null_ls_utils = require("null-ls.utils")

		-- for conciseness
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		-- configure null_ls
		null_ls.setup({
			-- add package.json as identifier for root (for typescript monorepos)
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			-- setup formatters & linters
			sources = {
				null_ls.builtins.formatting.black,
				null_ls.builtins.code_actions.shellcheck,
				null_ls.builtins.diagnostics.shellcheck,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.formatting.jq,
				null_ls.builtins.diagnostics.mypy.with({
					extra_args = function()
						local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
						return { "--ignore-missing-imports", "--python-executable", virtual .. "/bin/python3" }
					end,
				}),
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.jsonlint,

				--  to disable file types use
				--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
				formatting.prettier.with({
					extra_filetypes = { "svelte" },
					condition = function(utils)
						if utils.root_has_file_matches(".eslintrc") then
							return false
						end
						return true
					end,
				}), -- js/ts formatter
				formatting.stylua, -- lua formatter
				diagnostics.eslint_d.with({
					-- js/ts linter
					condition = function(utils)
						return utils.root_has_file_matches(".eslintrc") -- only enable if root has .eslintrc.js or .eslintrc.cjs
					end,
				}),
				formatting.eslint.with({
					-- js/ts linter
					condition = function(utils)
						return utils.root_has_file_matches(".eslintrc") -- only enable if root has .eslintrc.js or .eslintrc.cjs
					end,
				}),
				null_ls.builtins.diagnostics.buf, -- protobuf
				null_ls.builtins.formatting.buf,
			},
			-- configure format on save
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}
