-- do we really need this?
require('mason').setup()


local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'gopls',
})

lsp.nvim_workspace()

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap = true, silent = true }

    -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
end)


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = 'utf-8'
require('lspconfig').clangd.setup {
    capabilities = capabilities
}

lsp.skip_server_setup({ 'jdtls' })

lsp.setup()
