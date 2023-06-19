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

require("lazy").setup({
    {
        'mbbill/undotree',
        keys = { "<leader>U" }
    },
    {
        'f-person/git-blame.nvim',
        keys = { "<leader>gb" }
    },
    {
        'linty-org/readline.nvim',
        event = "VeryLazy",
    },
    {
        'gabrielpoca/replacer.nvim',
        keys = { "<leader>qr" },
    },
    {
        'folke/tokyonight.nvim',
    },
    {
        'ThePrimeagen/harpoon',
        keys   = {
            "<leader>A",
            "<leader>a",
            "<C-h>",
            "<C-t>",
        },
        config = function()
            require("harpoon").setup()

            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>A", mark.add_file, { desc = "Add Harpoon" })
            vim.keymap.set("n", "<leader>a", ui.toggle_quick_menu, { desc = "Harpoon quick menu" })

            vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        event = "VeryLazy",
    },
    {
        'eandrju/cellular-automaton.nvim',
        cmd = "CellularAutomaton",
    },
    -- {
    --     'saadparwaiz1/cmp_luasnip',
    --     event = "VeryLazy",
    -- },
    {
        'rhysd/conflict-marker.vim',
        event = "VeryLazy",
    },
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
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
    {
        'knubie/vim-kitty-navigator',
        event = "VeryLazy",
    },
    {
        'mfussenegger/nvim-jdtls',
        event = "VeryLazy",
    },
    {
        "gbprod/yanky.nvim",
        event = "VeryLazy",
        config = function()
            require("yanky").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end
    },
    {
        "giusgad/pets.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "giusgad/hologram.nvim",
        },
        config = function()
            require("pets").setup({})
        end,
    },
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
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
        event = "VeryLazy",
    },
    {
        -- for doing split resizing
        'mrjones2014/smart-splits.nvim',
        event = "VeryLazy",
        config = function()
            require('smart-splits').setup({})
        end
    },
    -- {
    --     'numToStr/Navigator.nvim',
    --     config = function()
    --         require('Navigator').setup()
    --     end
    -- },
    {
        'nvim-pack/nvim-spectre',
        event = "VeryLazy",
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
        event = "VeryLazy",
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
    -- {
    --     "AckslD/nvim-neoclip.lua",
    --     requires = {
    --         { 'kkharji/sqlite.lua',           module = 'sqlite' },
    --         { 'nvim-telescope/telescope.nvim' },
    --     },
    --     config = function()
    --         require("telescope").load_extension('neoclip')
    --         require('neoclip').setup({
    --             enable_persistent_history = true,
    --             -- continuous_sync = true, TODO: Would be cool to do this... but getting an 'attempt to index a boolean value' error
    --         })
    --     end,
    -- },
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
        event = "VeryLazy",
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
        event = "VeryLazy",
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
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
            -- require('lualine').setup({
            --     options = {
            --         theme = 'tokyonight'
            --     }
            -- })
        end
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
        event = "VeryLazy",
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
        event = "VeryLazy",
    },
    {
        "Wansmer/treesj",
        keys = {
            { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
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
    "zbirenbaum/copilot-cmp",
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        build = ":MasonUpdate",
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
        -- or                              , branch = '0.1.1',
        event = "VeryLazy",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'debugloop/telescope-undo.nvim',
        },
    },
    {
        "folke/zen-mode.nvim",
        event = "VeryLazy",
    },
})
