lvim.builtin.which_key.mappings.g.g = { "<cmd>Neogit<cr>", "Lazygit" }
lvim.builtin.which_key.mappings.s.t = { ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  "Search text" }

lvim.plugins = {
  {
    "linty-org/readline.nvim",
    config = function()
      local readline = require 'readline'
      vim.keymap.set('!', '<C-k>', readline.kill_line)
      vim.keymap.set('!', '<C-u>', readline.backward_kill_line)
      vim.keymap.set('!', '<M-d>', readline.kill_word)
      vim.keymap.set('!', '<M-BS>', readline.backward_kill_word)
      vim.keymap.set('!', '<C-w>', readline.unix_word_rubout)
      vim.keymap.set('!', '<C-d>', '<Delete>') -- delete-char
      vim.keymap.set('!', '<C-h>', '<BS>')     -- backward-delete-char
      vim.keymap.set('!', '<C-a>', readline.beginning_of_line)
      vim.keymap.set('!', '<C-e>', readline.end_of_line)
      vim.keymap.set('!', '<M-f>', readline.forward_word)
      vim.keymap.set('!', '<M-b>', readline.backward_word)
      vim.keymap.set('!', '<C-f>', '<Right>') -- forward-char
      vim.keymap.set('!', '<C-b>', '<Left>')  -- backward-char
      vim.keymap.set('!', '<C-n>', '<Down>')  -- next-line
      vim.keymap.set('!', '<C-p>', '<Up>')    -- previous-line
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
    },
    config = true
  },
  {
    "mickael-menu/zk-nvim",
    config = function()
      require("zk").setup({
        picker = "telescope",

        lsp = {
          -- `config` is passed to `vim.lsp.start_client(config)`
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
            -- on_attach = ...
            -- etc, see `:h vim.lsp.start_client()`
          },

          -- automatically attach buffers in a zk notebook that match the given filetypes
          auto_attach = {
            enabled = true,
            filetypes = { "markdown" },
          },
        },
      })
    end,
    cmd = { "ZkNew", "ZkNotes", "ZkTags" },
    keys = {
      { "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>" },
      { "<leader>zw", "<Cmd>ZkNew { group = 'work' }<CR>" },
      { "<leader>zd", "<Cmd>ZkNew { group = 'diary' }<CR>" },
      { "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>" },
      { "<leader>zt", "<Cmd>ZkTags<CR>" },
    },
  },
  {
    "Wansmer/treesj",
    keys = { { "<leader>m", ":TSJToggle<cr>", desc = "Join Toggle" } },
    config = function()
      require("treesj").setup({ use_default_keymaps = false, max_join_length = 150 })
    end,
  },
  {
    'stevearc/oil.nvim',
    opts = {
      win_options = {
        concealcursor = "nivc",
      },
      default_file_explorer = true,
      view_options = {
        -- show_hidden = true,
      },
      use_default_keymaps = false,
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["gv"] = "actions.select_vsplit",
        ["<C-s>"] = false,
        ["gs"] = "actions.select_split",
        ["gt"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["q"] = "actions.close",
        ["<C-r>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["g."] = "actions.toggle_hidden",
      },
    },
    keys = { { ";", ":lua require('oil').open()<CR>" } },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "knubie/vim-kitty-navigator",
    event = "VeryLazy",
  },
  {
    "github/copilot.vim",
    event = "VeryLazy",
    config = function()
      -- copilot assume mapped
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    "hrsh7th/cmp-copilot",
    config = function()
      lvim.builtin.cmp.formatting.source_names["copilot"] = "( )"
      table.insert(lvim.builtin.cmp.sources, 2, { name = "copilot" })
    end,
  },
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = { "--print-width", "100" },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = { "typescript", "typescriptreact" },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "flake8" },
  {
    name = "shellcheck",
    args = { "--severity", "warning" },
  },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    name = "proselint",
  },
}
