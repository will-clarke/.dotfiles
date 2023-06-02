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
    -- 'kana/vim-textobj-entire',
    -- kevinhwang91/nvim-bqf
    -- yazgoo/vmux
    -- 'Matt-A-Bennett/vim-surround-funk',
    'mbbill/undotree',
    'f-person/git-blame.nvim',
    'linty-org/readline.nvim',
    'gabrielpoca/replacer.nvim',
    'folke/tokyonight.nvim',
    'ThePrimeagen/harpoon',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/nvim-cmp',
    'nvim-treesitter/nvim-treesitter-context',
    'eandrju/cellular-automaton.nvim',
    'saadparwaiz1/cmp_luasnip',
    'nvim-pack/nvim-spectre',
    -- 'vimwiki/vimwiki', -- do we need this???
    {
        "mickael-menu/zk-nvim",
        config = function()
            require("zk").setup({
                picker = "telescope",
            })
        end
    },

    {
        'nvim-orgmode/orgmode',
        -- ft = { 'org' },
        config = function()
            require('orgmode').setup {}
        end
    },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {},  -- Loads default behaviour
                    ["core.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.dirman"] = {      -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = "~/notes2",
                                lolzzz = "~/notes3",
                            },
                        },
                    },
                },
            }
        end,
    },
    {
        "ellisonleao/glow.nvim", -- cool markdown previewr
        config = true,
        cmd = "Glow",
    },
    {
        "AckslD/nvim-neoclip.lua",
        requires = {
            { 'kkharji/sqlite.lua',           module = 'sqlite' },
            { 'nvim-telescope/telescope.nvim' },
        },
        config = function()
            require("telescope").load_extension('neoclip')
            require('neoclip').setup({
                enable_persistent_history = true,
            })
        end,
    },
    {
        'sindrets/diffview.nvim',
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
        config = function()
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("toggleterm").setup {
                open_mapping = [[<c-\>]],
            }
        end
    },
    {
        'folke/neodev.nvim',
        config = function()
            require("neodev").setup({})
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
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },
    "nvim-neotest/neotest-go",
    {
        "yanskun/gotests.nvim",
        ft = "go",
        config = function()
            -- go install -v github.com/cweill/gotests/gotests@v1.6.0
            require("gotests").setup()
        end,
    },
    {
        "nvim-neotest/neotest",
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
    'Wansmer/treesj',
    'nvim-treesitter/nvim-treesitter-textobjects',
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- config = function()
        --     require("oil").setup()
        -- end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },
    'tpope/vim-surround',
    -- 'tpope/vim-fugitive',
    'knsh14/vim-github-link',
    'ggandor/lightspeed.nvim',
    {
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim',
        lazy = true,
        config = function()
            require('neogit').setup {}
        end,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
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
        build = ":MasonUpdate",
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
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
        config = function()
            require('Comment').setup()
        end
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({})
        end,
    },
    { "folke/neoconf.nvim",              cmd = "Neoconf" },
    { 'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate' },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        -- or                              , branch = '0.1.1',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'debugloop/telescope-undo.nvim',
        },
    },
    "folke/zen-mode.nvim",
})
