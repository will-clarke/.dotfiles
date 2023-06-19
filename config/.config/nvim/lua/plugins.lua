local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
require("lazy").setup({
    {
        'mbbill/undotree',
        keys = { { "<leader>U", vim.cmd.UndotreeToggle, desc = "Undo" } },
    },
    {
        'f-person/git-blame.nvim',
        keys = { { "<leader>gb", ":GitBlameToggle<CR>", desc = "git blame" } }
    },
    {
        'linty-org/readline.nvim',
        event = "VeryLazy",
    },
    {
        'gabrielpoca/replacer.nvim',
        keys = { "<leader>qr", ':lua require("replacer").run()<cr>', desc = "replacer" },
    },
    {
        'folke/tokyonight.nvim',
    },
    {
        'ThePrimeagen/harpoon',
        keys = {
            { "<leader>a", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "harpoon" },
            { "<leader>A", ":lua require('harpoon.mark').add_file()<CR>",        desc = "harpoon add file" },
            { "<C-h>",     ":lua require('harpoon.ui').nav_file(1)<CR>",         desc = "harpoon 1" },
            { "<C-t>",     ":lua require('harpoon.ui').nav_file(2)<CR>",         desc = "harpoon 2" },
        },
        opt  = {}
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        event = "VeryLazy",
    },
    {
        'eandrju/cellular-automaton.nvim',
        cmd = "CellularAutomaton",
    },
    {
        'rhysd/conflict-marker.vim',
        event = "VeryLazy",
    },
    -- {
    --     'hrsh7th/nvim-cmp',
    --     event = "InsertEnter",
    --     dependencies = {
    --         "hrsh7th/cmp-buffer",
    --         "hrsh7th/cmp-nvim-lsp",
    --         'hrsh7th/cmp-buffer',
    --         'hrsh7th/cmp-calc',
    --         'hrsh7th/cmp-cmdline',
    --         'hrsh7th/cmp-emoji',
    --         'hrsh7th/cmp-nvim-lua',
    --         'hrsh7th/cmp-path',
    --         'petertriho/cmp-git',
    --         'saadparwaiz1/cmp_luasnip',
    --     },
    --     config = function()
    --         local luasnip = require("luasnip")
    --         local cmp = require("cmp")
    --
    --         local has_words_before = function()
    --             print("has_words_before")
    --             unpack = unpack or table.unpack
    --             local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    --             -- return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    --             ret = col ~= 0 and
    --                 vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    --             print("ret = " .. tostring(ret))
    --             return ret
    --         end
    --
    --         cmp.setup {
    --             view = {
    --                 entries = "custom" -- can be "custom", "wildmenu" or "native"
    --             },
    --             snippet = {
    --                 expand = function(args)
    --                     require 'luasnip'.lsp_expand(args.body)
    --                 end
    --             },
    --             sources = cmp.config.sources({
    --                 { name = "copilot" },
    --                 { name = "nvim_lsp" },
    --                 { name = 'luasnip' },
    --                 { name = 'emoji' },
    --                 { name = "path" },
    --                 { name = 'calc' },
    --                 { name = "git" },
    --             }, {
    --                 { name = 'buffer' },
    --             }),
    --
    --             mapping = cmp.mapping.preset.insert({
    --                 ['<C-j>'] = cmp.mapping.select_next_item(),
    --                 ['<C-k>'] = cmp.mapping.select_prev_item(),
    --                 ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    --                 ['<C-f>'] = cmp.mapping.scroll_docs(4),
    --                 ['<C-Space>'] = cmp.mapping.complete(),
    --                 ['<C-e>'] = cmp.mapping.abort(),
    --                 ["<M-Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    --                 ["<C-Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    --
    --                 ["<Tab>"] = cmp.mapping({
    --                     i = function(fallback)
    --                         if luasnip.expand_or_jumpable() then
    --                             luasnip.expand_or_jump()
    --                         elseif has_words_before() then
    --                             require('cmp').confirm({ select = true })
    --                         else
    --                             fallback()
    --                         end
    --                     end }),
    --                 ["<CR>"] = cmp.mapping({
    --                     i = function(fallback)
    --                         if cmp.visible() and cmp.get_active_entry() then
    --                             cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
    --                         else
    --                             fallback()
    --                         end
    --                     end,
    --                     -- s = cmp.mapping.confirm({ select = true }),
    --                     -- c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    --                 }),
    --             }),
    --
    --         }
    --
    --         cmp.setup.filetype('gitcommit', {
    --             sources = cmp.config.sources({
    --                 { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    --             }, {
    --                 { name = 'buffer' },
    --             })
    --         })
    --
    --         cmp.setup.cmdline('/', {
    --             mapping = cmp.mapping.preset.cmdline(),
    --             sources = {
    --                 { name = 'buffer' }
    --             }
    --         })
    --
    --         require("copilot_cmp").setup({})
    --
    --         require("cmp_git").setup({})
    --
    --         require("copilot").setup({
    --             -- we're disabling these as copilot-cmp is dealing with it
    --             suggestion = {
    --                 enabled = false,
    --             },
    --             panel = {
    --                 enabled = false,
    --             },
    --             -- filetypes = {
    --             --     markdown = true,
    --             -- },
    --         })
    --     end,
    -- },
    {
        'knubie/vim-kitty-navigator',
        cmd = {
            "KittyNavigateRight",
            "KittyNavigateLeft",
            "KittyNavigateUp",
            "KittyNavigateDown",
        },
        config = function()
            vim.keymap.set({ 'n', 't' }, '<A-h>', '<CMD>KittyNavigateLeft<CR>')
            vim.keymap.set({ 'n', 't' }, '<A-l>', '<CMD>KittyNavigateRight<CR>')
            vim.keymap.set({ 'n', 't' }, '<A-k>', '<CMD>KittyNavigateUp<CR>')
            vim.keymap.set({ 'n', 't' }, '<A-j>', '<CMD>KittyNavigateDown<CR>')
            vim.keymap.set({ 'n', 't' }, '<A-p>', '<CMD>KittyNavigatePrevious<CR>')
        end,
    },
    {
        'mfussenegger/nvim-jdtls',
        event = "VeryLazy",
    },
    {
        "gbprod/yanky.nvim",
        keys = {
            { "p",     "<Plug>(YankyPutAfter)",     desc = "Yank after cursor" },
            { "P",     "<Plug>(YankyPutBefore)",    desc = "Yank before cursor" },
            { "<c-p>", "<Plug>(YankyCycleForward)" },
            { "<c-n>", "<Plug>(YankyCycleBackward)" },
        },
        config = function()
            require("yanky").setup({})
        end,
    },
    {
        "jackMort/ChatGPT.nvim",
        cmd = { "ChatGPT" },
        config = function()
            require("chatgpt").setup()
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        'pwntester/octo.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require "octo".setup()
        end,
        cmd = "Octo",
    },
    {
        -- for doing split resizing
        'mrjones2014/smart-splits.nvim',
        event = "VeryLazy",
        config = function()
            require('smart-splits').setup({})
            vim.keymap.set('n', '<M-H>', require('smart-splits').resize_left)
            vim.keymap.set('n', '<M-J>', require('smart-splits').resize_down)
            vim.keymap.set('n', '<M-K>', require('smart-splits').resize_up)
            vim.keymap.set('n', '<M-L>', require('smart-splits').resize_right)
        end,
        keys = {
            '<M-H>',
            '<M-J>',
            '<M-K>',
            '<M-L>',
        }
    },
    {
        'nvim-pack/nvim-spectre',
        cmd = 'Spectre',
    },
    {
        "max397574/better-escape.nvim",
        event = "VeryLazy",
        config = function()
            require("better_escape").setup()
        end,
    },
    {
        'mfussenegger/nvim-dap',
        keys = {
            "<leader>d"
        },
        config = function()
            vim.keymap.set('n', '<leader>dt', require('dap-go').debug_test, { desc = "test (go)" })
            vim.keymap.set('n', '<leader>dc', require('dap').continue, { desc = "continue / START!" })
            vim.keymap.set('n', '<leader>ds', require('dap').step_over, { desc = "Step over " })
            vim.keymap.set('n', '<leader>di', require('dap').step_into, { desc = "step In" })
            vim.keymap.set('n', '<leader>do', require('dap').step_out, { desc = "step Out" })
            vim.keymap.set('n', '<Leader>db', require('dap').toggle_breakpoint, { desc = "breakpoint" })
            -- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
            vim.keymap.set('n', '<Leader>dm',
                function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
                { desc = "message??" })
            vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, { desc = "repl" })
            vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = "last run" })
            vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
                require('dap.ui.widgets').hover()
            end, { desc = "hover" })
            vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
                require('dap.ui.widgets').preview()
            end, { desc = "preview" })
            vim.keymap.set('n', '<Leader>df', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.frames)
            end, { desc = "frames" })
            vim.keymap.set('n', '<Leader>dS', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.scopes)
            end, { desc = "scopes" })

            vim.keymap.set('n', '<Leader>du', function() require('dapui').toggle() end, { desc = "UI toggle" })
        end
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
            require("nvim-dap-virtual-text").setup()
        end,
        event = "VeryLazy",
    },
    {
        'leoluz/nvim-dap-go',
        config = function()
            require('dap-go').setup()
        end,
        event = "VeryLazy",
    },
    {
        'rcarriga/nvim-dap-ui',
        requires = { "mfussenegger/nvim-dap" },
        event = "VeryLazy",
        config = function()
            require("dapui").setup()

            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
    {
        "mickael-menu/zk-nvim",
        event = "VeryLazy",
        config = function()
            require("zk").setup({
                picker = "telescope",
            })
        end
    },
    {
        "ellisonleao/glow.nvim", -- cool markdown previewr
        config = true,
        event = "VeryLazy",
        cmd = "Glow",
    },
    {
        'sindrets/diffview.nvim',
        event = "VeryLazy",
        config = function()
            require 'diffview'.setup({})
        end
    },
    {
        "gaoDean/autolist.nvim",
        ft = {
            "markdown",
            "text",
            "tex",
            "plaintex",
        },
        event = "VeryLazy",
        config = function()
            local autolist = require("autolist")
            autolist.setup()
            autolist.create_mapping_hook("i", "<CR>", autolist.new)
            autolist.create_mapping_hook("i", "<Tab>", autolist.indent)
            autolist.create_mapping_hook("i", "<S-Tab>", autolist.indent, "<C-D>")
            autolist.create_mapping_hook("n", "o", autolist.new)
            autolist.create_mapping_hook("n", "O", autolist.new_before)
            autolist.create_mapping_hook("n", ">>", autolist.indent)
            autolist.create_mapping_hook("n", "<<", autolist.indent)
            autolist.create_mapping_hook("n", "<C-r>", autolist.force_recalculate)
            autolist.create_mapping_hook("n", "<leader>x", autolist.invert_entry, "")
        end,
    },
    {
        'RRethy/vim-illuminate',
        keys = "*",
        config = function()
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
        event = "VeryLazy",
    },
    {
        'akinsho/toggleterm.nvim',
        event = "VeryLazy",
        version = "*",
        config = function()
            require("toggleterm").setup {
                open_mapping = [[<c-\>]],
            }
        end
    },
    {
        'folke/neodev.nvim',
        ft = "lua",
        config = function()
            require("neodev").setup({
                library = { plugins = { "nvim-dap-ui" }, types = true },
            })
        end

    },
    {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
            opt = true,
        },
        opt = {},
    },
    {
        "folke/trouble.nvim",
        event = "VeryLazy",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end
    },
    {
        "nvim-neotest/neotest-go",
        event = "VeryLazy",
    },
    {
        "yanskun/gotests.nvim",
        ft = "go",
        config = function()
            -- go install -v github.com/cweill/gotests/gotests@v1.6.0
            require("gotests").setup()
        end,
        event = "VeryLazy",
    },
    {
        "nvim-neotest/neotest",
        ft = "go",
        cmd = "Neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-go",

        },
        config = function()
            require("neotest").setup({
                adapters = {
                    -- require("neotest-plenary"),
                    require("neotest-go")({
                        experimental = {
                            test_table = true,
                        },
                        args = { "-count=1", "-timeout=60s" }
                    })
                }

            })

            vim.keymap.set('n', '<leader>tr', function()
                require("neotest").summary.open()
                require("neotest").run.run()
            end, { desc = "Test" })
            vim.keymap.set('n', '<leader>tf', function()
                require("neotest").run.run(vim.fn.expand("%"))
            end, { desc = "Test file" })
            vim.keymap.set('n', '<leader>td', function()
                require("neotest").run.run({ strategy = "dap" })
            end, { desc = "Debug" })
            vim.keymap.set('n', '<leader>ta', require("neotest").run.attach, { desc = "Attach to test" })
            vim.keymap.set('n', '<leader>to', require("neotest").output_panel.toggle, { desc = "Output toggle" })
            vim.keymap.set('n', '<leader>tO',
                function()
                    require("neotest").output.open({ enter = true })
                end
                , { desc = "Output open" })

            vim.keymap.set('n', '<leader>ts', require("neotest").summary.toggle, { desc = "Summary of test" })


            -- TODO: Get working
            -- nnoremap <silent>[n <cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>
            -- nnoremap <silent>]n <cmd>lua require("neotest").jump.next({ status = "failed" })<CR>
        end
    },
    {
        "monaqa/dial.nvim",
        -- lazy-load on keys
        -- mode is `n` by default. For more advanced options, check the section on key mappings
        keys = { "<C-a>", { "<C-x>", mode = "n" } },
    },
    {
        "stevearc/dressing.nvim",
        opts = {},
    },
    {
        "Wansmer/treesj",
        keys = {
            { "<leader>m", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
        },
        opts = { use_default_keymaps = false, max_join_length = 150 },
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        event = "VeryLazy",
    },
    {
        'stevearc/oil.nvim',
        event = "VeryLazy",
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- config = function()
        --     require("oil").setup()
        -- end
    },
    {
        'lewis6991/gitsigns.nvim',
        event = "VeryLazy",
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        'tpope/vim-surround',
        event = "VeryLazy",
    },
    {
        'tpope/vim-fugitive',
        event = "VeryLazy",
    },
    {
        'knsh14/vim-github-link',
        event = "VeryLazy",
    },
    {
        'ggandor/lightspeed.nvim',
        event = "VeryLazy",
    },
    -- {
    --     'TimUntersberger/neogit',
    --     requires = 'nvim-lua/plenary.nvim',
    --     lazy = true,
    --     config = function()
    --         require('neogit').setup {}
    --     end,
    -- },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        event = "VeryLazy",
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {
                'L3MON4D3/LuaSnip',
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-nvim-lsp",
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-calc',
                'hrsh7th/cmp-cmdline',
                'hrsh7th/cmp-emoji',
                'hrsh7th/cmp-nvim-lua',
                'hrsh7th/cmp-path',
                'petertriho/cmp-git',
                'saadparwaiz1/cmp_luasnip',
            },
        },
        config = function()
            require("snippets")
            -- Here is where you configure the autocompletion settings.
            -- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
            -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

            require('lsp-zero.cmp').extend()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero.cmp').action()

            local luasnip = require("luasnip")

            local has_words_before = function()
                print("has_words_before")
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                -- return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
                ret = col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
                print("ret = " .. tostring(ret))
                return ret
            end

            cmp.setup({
                mapping = {
                    -- ['<C-Space>'] = cmp.mapping.complete(),
                    -- ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    -- ['<C-b>'] = cmp_action.luasnip_jump_backward(),

                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ["<M-Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<C-Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

                    ["<Tab>"] = cmp.mapping({
                        i = function(fallback)
                            if luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                            elseif has_words_before() then
                                require('cmp').confirm({ select = true })
                            else
                                fallback()
                            end
                        end }),
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
                }
            })


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
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
        },
        config = function()
            -- This is where all the LSP shenanigans will live

            local lsp = require('lsp-zero')

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
            end)

            -- (Optional) Configure lua language server for neovim
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            lsp.setup()
        end
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        event = "VeryLazy",
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                build = function()
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },
    {
        "zbirenbaum/copilot-cmp",
        event = "VeryLazy",
    }
    , {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    config = function()
        require('Comment').setup()
    end
},
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({})
        end,
    },
    {
        "folke/neoconf.nvim",
        event = "VeryLazy",
        cmd = "Neoconf",
    },
    {
        'nvim-treesitter/nvim-treesitter',
        event = "VeryLazy",
        cmd = 'TSUpdate',
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        event = "VeryLazy",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'debugloop/telescope-undo.nvim',
        },
    },
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
    },
})
