local status_ok, GO = pcall(require, "go")
if not status_ok then
  vim.notify("something went wrong - can't require go")
  return
end

require("go").setup({})

-- local map = function(type, key, value)
--   vim.api.nvim_set_keymap(type, key, value, { noremap = true, silent = true });
-- end
--
-- map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
-- map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
-- map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
-- map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
-- map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
-- map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
-- map('n', '<leader>gw', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
-- map('n', '<leader>gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
-- map('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>')
-- map('n', '<leader>lf', '<cmd>lua vim.lsp.buf.code_action()<CR>')
-- map('n', '<leader>le', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
-- map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- map('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
-- map('n', '<leader>li', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
-- map('n', '<leader>lo', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
--
--
--
