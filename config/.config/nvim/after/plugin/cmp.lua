local luasnip = require("luasnip")
local cmp = require("cmp")

local has_words_before = function()
    print("has_words_before")
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    -- return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    ret = col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    print("ret = " .. tostring(ret))
    return ret
end

cmp.setup {
    view = {
        entries = "custom" -- can be "custom", "wildmenu" or "native"
    },
    snippet = {
        expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
        end
    },
    sources = cmp.config.sources({
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = 'luasnip' },
        { name = 'emoji' },
        { name = "path" },
        { name = 'calc' },
        { name = "git" },
    }, {
        { name = 'buffer' },
    }),


    mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ["<M-Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

        ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                require('cmp').confirm({ select = true })
            else
                fallback()
            end
        end),
        ["<CR>"] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() and cmp.get_active_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback()
                end
            end,
            -- s = cmp.mapping.confirm({ select = true }),
            -- c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),
    }),

}

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
        { name = 'buffer' },
    })
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

require("copilot_cmp").setup({})

require("cmp_git").setup({})

require("copilot").setup({
    -- we're disabling these as copilot-cmp is dealing with it
    suggestion = {
        enabled = false,
    },
    panel = {
        enabled = false,
    },
    -- filetypes = {
    --     markdown = true,
    -- },
})
