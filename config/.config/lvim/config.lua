lvim.colorscheme = "kanagawa"
lvim.builtin.nvimtree.active = false

lvim.builtin.telescope.defaults.layout_config = { horizontal = { width = 0.99 } }
lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = function(...)
  local actions = require("telescope.actions")
  actions.move_selection_next(...)
end
lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = function(...)
  local actions = require("telescope.actions")
  actions.move_selection_previous(...)
end
lvim.builtin.telescope.defaults.mappings.i["<C-g>"] = function(...)
  local actions = require("telescope.actions")
  actions.close(...)
end
lvim.builtin.telescope.defaults.mappings.i["<esc>"] = function(...)
  local actions = require("telescope.actions")
  actions.close(...)
end


lvim.builtin.telescope.extensions.live_grep_args = {
  auto_quoting = true,           -- enable/disable auto-quoting
  mappings = {                   -- extend mappings
    i = {
      ["<C-y>"] = require("telescope-live-grep-args.actions").quote_prompt(),
      ["<C-v>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " -g!vendor " }),
      ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
    },
  },
}

lvim.builtin.which_key.mappings["/"] = { ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  "Search text" }
lvim.builtin.which_key.mappings.g.g = { "<cmd>Neogit<cr>", "Lazygit" }
lvim.builtin.which_key.mappings.s.t = { ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  "Search text" }

lvim.plugins = {
  "rebelot/kanagawa.nvim",
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
  "ChristianChiarulli/swenv.nvim",
  "stevearc/dressing.nvim",
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
  "nvim-neotest/neotest-go",
  { "tpope/vim-repeat" },
  {
    "felipec/vim-sanegx",
    event = "BufRead",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = {     -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },


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

  { "nvim-telescope/telescope-live-grep-args.nvim" },

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
      { "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", "Zk New" },
      { "<leader>zw", "<Cmd>ZkNew { group = 'work' }<CR>",                  "Zk Work" },
      { "<leader>zd", "<Cmd>ZkNew { group = 'diary' }<CR>",                 "Zk Diary" },
      { "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>",         "Zk Open" },
      { "<leader>zt", "<Cmd>ZkTags<CR>",                                    "Zk Tags" },
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
  -- {
  --   "github/copilot.vim",
  --   event = "VeryLazy",
  --   config = function()
  --     -- copilot assume mapped
  --     vim.g.copilot_assume_mapped = true
  --     vim.g.copilot_no_tab_map = true
  --   end,
  -- },
  -- {
  --   "hrsh7th/cmp-copilot",
  --   config = function()
  --     lvim.builtin.cmp.formatting.source_names["copilot"] = "( )"
  --     table.insert(lvim.builtin.cmp.sources, 2, { name = "copilot" })
  --   end,
  -- },

  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
        require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)
    end,
  }
}






local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "goimports", filetypes = { "go" } },
  { command = "gofumpt",   filetypes = { "go" } },
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
  { name = "flake8", filetypes = { "python" } },
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




lvim.autocommands = {
  {
    "BufWinEnter", {
    pattern = { "COMMIT_EDITMSG", "NeogitCommitMessage" },
    callback = function()
      vim.wo.spell = true
      vim.api.nvim_win_set_cursor(0, { 1, 0 })
      if vim.fn.getline(1) == "" then
        vim.cmd("startinsert!")
      end
    end
  },
  }
}


lvim.builtin.treesitter.ensure_installed = {
  "go",
  "gomod",
  "python",
}

lvim.format_on_save = {
  pattern = { "*.go", "*.py" },
  enabled = true,
}

------------------------
-- Dap
------------------------
local dap_ok, dapgo = pcall(require, "dap-go")
if not dap_ok then
  return
end

dapgo.setup()

------------------------
-- LSP
------------------------
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "gopls" })

local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("golangci_lint_ls", {
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})

lsp_manager.setup("gopls", {
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
    local _, _ = pcall(vim.lsp.codelens.refresh)
    local map = function(mode, lhs, rhs, desc)
      if desc then
        desc = desc
      end

      vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
    end
    map("n", "<leader>Ci", "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies")
    map("n", "<leader>Ct", "<cmd>GoMod tidy<cr>", "Tidy")
    map("n", "<leader>Ca", "<cmd>GoTestAdd<Cr>", "Add Test")
    map("n", "<leader>CA", "<cmd>GoTestsAll<Cr>", "Add All Tests")
    map("n", "<leader>Ce", "<cmd>GoTestsExp<Cr>", "Add Exported Tests")
    map("n", "<leader>Cg", "<cmd>GoGenerate<Cr>", "Go Generate")
    map("n", "<leader>Cf", "<cmd>GoGenerate %<Cr>", "Go Generate File")
    map("n", "<leader>Cc", "<cmd>GoCmt<Cr>", "Generate Comment")
    map("n", "<leader>DT", "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test")
  end,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
  settings = {
    gopls = {
      usePlaceholders = true,
      gofumpt = true,
      codelenses = {
        generate = false,
        gc_details = true,
        test = true,
        tidy = true,
      },
    },
  },
})

local status_ok, gopher = pcall(require, "gopher")
if not status_ok then
  return
end

-- :MasonInstall gopls golangci-lint-langserver delve goimports gofumpt gomodifytags gotests impl
gopher.setup {
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "gotests",
    impl = "impl",
    iferr = "iferr",
  },
}



-- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- setup testing
require("neotest").setup({
  adapters = {
    require("neotest-go")({}),
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    })
  }
})

lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>",
  "Test Method" }
lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
  "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
lvim.builtin.which_key.mappings["dF"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }

-- binding for switching
lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}



lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "live_grep_args")
  -- pcall(telescope.load_extension, "neoclip")
end


lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
