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
    --

    {
        'f-person/git-blame.nvim',
        -- config = function()
        --     vim.opt.gitblame_enabled = 0
        --     require("gitblame").gitblame_enabled = 0
        -- end
    },
    'linty-org/readline.nvim',
    'gabrielpoca/replacer.nvim',
    'folke/tokyonight.nvim',
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
            config = function()
                require('lualine').setup({
                    options = {
                        theme = 'tokyonight'
                    }
                })
            end
        }
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
    {
        'nvim-treesitter/nvim-treesitter-textobjects',


        config = function()
            require 'nvim-treesitter.configs'.setup {
                textobjects = {
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = { query = "@class.outer", desc = "Next class start" },
                            --
                            -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
                            ["]o"] = "@loop.*",
                            -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
                            --
                            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                        -- Below will go to either the start or the end, whichever is closer.
                        -- Use if you want more granular movements
                        -- Make it even more gradual by adding multiple queries and regex.
                        goto_next = {
                            ["]d"] = "@conditional.outer",
                        },
                        goto_previous = {
                            ["[d"] = "@conditional.outer",
                        }
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>ls"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>lS"] = "@parameter.inner",
                        },
                    },
                    select = {
                        enable = true,

                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            -- You can optionally set descriptions to the mappings (used in the desc parameter of
                            -- nvim_buf_set_keymap) which plugins like which-key display
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                            -- You can also use captures from other query groups like `locals.scm`
                            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                        },
                        -- You can choose the select mode (default is charwise 'v')
                        --
                        -- Can also be a function which gets passed a table with the keys
                        -- * query_string: eg '@function.inner'
                        -- * method: eg 'v' or 'o'
                        -- and should return the mode ('v', 'V', or '<c-v>') or a table
                        -- mapping query_strings to modes.
                        selection_modes = {
                            ['@parameter.outer'] = 'v', -- charwise
                            ['@function.outer'] = 'V',  -- linewise
                            ['@class.outer'] = '<c-v>', -- blockwise
                        },
                        -- If you set this to `true` (default is `false`) then any textobject is
                        -- extended to include preceding or succeeding whitespace. Succeeding
                        -- whitespace has priority in order to act similarly to eg the built-in
                        -- `ap`.
                        --
                        -- Can also be a function which gets passed a table with the keys
                        -- * query_string: eg '@function.inner'
                        -- * selection_mode: eg 'v'
                        -- and should return true of false
                        include_surrounding_whitespace = true,
                    },
                },
            }
        end


    },
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup()
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },
    'tpope/vim-surround',
    -- 'tpope/vim-fugitive',
    'nvim-treesitter/nvim-treesitter',
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
        'ThePrimeagen/harpoon',
        config = function()
            -- require("telescope").load_extension('harpoon')
        end
    },
    'hrsh7th/cmp-nvim-lua',
    {
        'hrsh7th/nvim-cmp',
        config = function()
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
        end
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                -- we're disabling these as copilot-cmp is dealing with it
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup({


            })
        end
    },

    -- 'Matt-A-Bennett/vim-surround-funk',
    ----	{
    --		"nvim-tree/nvim-tree.lua",
    --		version = "*",
    --		dependencies = {
    --			"nvim-tree/nvim-web-devicons",
    --		},
    --		config = function()
    --			require("nvim-tree").setup {}
    --		end,
    --	},
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
        "luukvbaal/nnn.nvim",
        config = function()
            require("nnn").setup({
                explorer = {
                    cmd = "nnn -e",
                },
                --			style = { border = "rounded" },
                --			session = "shared",
                --		},
                replace_netrw = "explorer",
                --	windownav = "<C-l>"
            })
        end
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true

            vim.o.timeoutlen = 300
            require("which-key").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    },
    { "folke/neoconf.nvim",              cmd = "Neoconf" },
    { 'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate' },
    "folke/trouble.nvim",
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        -- or                              , branch = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim',
            'debugloop/telescope-undo.nvim',
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            telescope.setup({
                extensions = { undo = {} },
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                    },
                },
            })
        end
    },
    { 'rose-pine/neovim',     name = 'rose-pine' },


    { 'neovim/nvim-lspconfig' },

    "folke/zen-mode.nvim",
    "eandrju/cellular-automaton.nvim",
})

require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "vimdoc", "javascript", "typescript", "go", "c", "lua", "rust" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.cmd [[colorscheme tokyonight]]
