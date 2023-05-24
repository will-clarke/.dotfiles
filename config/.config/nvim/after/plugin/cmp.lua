local cmp = require 'cmp'

cmp.setup {
    sources = cmp.config.sources({
        -- Copilot Source
        { name = "copilot",  group_index = 2, priority = 5 },
        -- Other Sources
        { name = "nvim_lsp", group_index = 2 },
        -- { name = 'nvim_lua' },

        { name = "path",     group_index = 2 },
    }),
    mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Tab>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

}

require("copilot_cmp").setup({})


            require("copilot").setup({
                -- we're disabling these as copilot-cmp is dealing with it
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
