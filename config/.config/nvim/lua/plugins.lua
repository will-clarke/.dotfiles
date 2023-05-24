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
    'f-person/git-blame.nvim',
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
    'hrsh7th/nvim-cmp',
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
    },
    "zbirenbaum/copilot-cmp",
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
        dependencies = { 'nvim-lua/plenary.nvim',
            'debugloop/telescope-undo.nvim',
        },
    },
    'neovim/nvim-lspconfig',
    "folke/zen-mode.nvim",
})


-- set termguicolors to enable highlight groups
-- vim.cmd [[colorscheme tokyonight]]
