lvim.colorscheme = "kanagawa"
lvim.builtin.nvimtree.active = false


-- telescope
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

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "live_grep_args")
  pcall(telescope.load_extension, "frecency")
  pcall(telescope.load_extension, "neoclip")
end

local ok, lga_actions = pcall(require, "telescope-live-grep-args.actions")
if ok then
  lvim.builtin.telescope.extensions.live_grep_args = {
    auto_quoting = true,
    mappings = {
      i = {
        ["<C-y>"] = lga_actions.quote_prompt(),
        ["<C-v>"] = lga_actions.quote_prompt({ postfix = " -g!vendor " }),
        ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
      },
    },
  }
end


-- keybindings
lvim.builtin.which_key.mappings["p"] = { ":Telescope neoclip<CR>", "paste clipboard" }
lvim.builtin.which_key.mappings["/"] = { ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  "Search text" }
lvim.builtin.which_key.mappings["?"] = { ":Telescope grep_string<CR>", "grep string" }
lvim.builtin.which_key.mappings["lo"] = { ":AeialToggle<CR>", "outline toggle" }
lvim.builtin.which_key.mappings["<CR>"] = { ":Make<CR>", "make" }
lvim.builtin.which_key.mappings.g.g = { "<cmd>Neogit<cr>", "Lazygit" }
lvim.builtin.which_key.mappings.s.t = { ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  "Search text" }


-- plugins
lvim.plugins = {
  -- 'terrastruct/d2-vim',
  "rebelot/kanagawa.nvim",
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
  "ChristianChiarulli/swenv.nvim",
  "stevearc/dressing.nvim",
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
  "nvim-neotest/neotest-go",
  "wsdjeg/vim-fetch",
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "ray-x/sad.nvim",
    dependencies = { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
    config = function()
      require("sad").setup {}
    end,
  },
  {
    'ldelossa/gh.nvim',
    dependencies = { 'ldelossa/litee.nvim' },
    config = function()
      require('litee.lib').setup()
      require('litee.gh').setup()
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  },
  "tpope/vim-dispatch",
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
  {
    "chrishrb/gx.nvim",
    event = { "BufEnter" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true, -- default settings
  },
  {
    'ruifm/gitlinker.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  { "tpope/vim-repeat" },
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { 'nvim-telescope/telescope.nvim' },
      { 'kkharji/sqlite.lua',           module = 'sqlite' },
    },
    config = function()
      require('neoclip').setup({
        enable_persistent_history = true,
        continuous_sync = true,
        keys = {
          telescope = {
            i = {
              -- select = '<cr>',
              -- paste = '<c-p>',
              select = '<c-z>',
              paste = '<cr>',
              paste_behind = '<c-P>',
              -- replay = '<c-q>', -- replay a macro
              -- delete = '<c-d>', -- delete an entry
              -- edit = '<c-e>', -- edit an entry
              -- custom = {},
            },
            -- n = {
            --   select = '<cr>',
            --   paste = 'p',
            --   --- It is possible to map to more than one key.
            --   -- paste = { 'p', '<c-p>' },
            --   paste_behind = 'P',
            --   replay = 'q',
            --   delete = 'd',
            --   edit = 'e',
            --   custom = {},
            -- },
          },
        },

      })
    end,
  },
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
    "nvim-telescope/telescope-frecency.nvim",
    -- config = function()
    --   require "telescope".load_extension("frecency")
    -- end,
    dependencies = { "kkharji/sqlite.lua" },
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
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
          },
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
    lazy = false,
    opts = {
      win_options = {
        concealcursor = "nivc",
      },
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
      use_default_keymaps = false,
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
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
    event = "VeryLazy",
  },
  {
    "knubie/vim-kitty-navigator",
    event = "VeryLazy",
  },
  {
    "hrsh7th/cmp-emoji",
  },
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

lvim.builtin.cmp.sources = vim.list_extend(
  lvim.builtin.cmp.sources, {
    { name = "emoji" },
  })

local null_ls = require "null-ls"
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  null_ls.builtins.formatting.jq,
  -- { command = "goimports", filetypes = { "go" } },
  -- { command = "gofumpt",   filetypes = { "go" } },
  { name = "black" },
  { name = "djlint", filetypes = { "django", "jinja.html", "htmldjango" } },
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


lvim.builtin.treesitter.ensure_installed = { "go", "gomod", "python" }

lvim.format_on_save = {
  pattern = { "*.go", "*.py", "*lua" },
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

lsp_manager.setup("lua_ls", {
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})
lsp_manager.setup("pyright", {
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})
lsp_manager.setup("jsonls", {})

-- lsp_manager.setup("golangci_lint_ls", {
--   on_init = require("lvim.lsp").common_on_init,
--   capabilities = require("lvim.lsp").common_capabilities(),
-- })

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

lvim.lsp.installer.setup.ensure_installed = {
  "gopls", "golangci_lint_ls", "pyright"
}
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

lvim.builtin.which_key.mappings["F"] = { "<cmd>Telescope frecency<cr>", "frequency" }
lvim.builtin.which_key.mappings["y"] = { "<cmd>Telescope neoclip<cr>", "neoclip" }
-- lvim.builtin.which_key.mappings["C-p"] = { "<cmd>Telescope neoclip<cr>", "neoclip" }

lvim.builtin.which_key.mappings["tM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
  "Test Method DAP" }
lvim.builtin.which_key.mappings["tt"] = { "<cmd>lua require('neotest').run.run()<cr>", "Test" }
lvim.builtin.which_key.mappings["to"] = { "<cmd>lua require('neotest').output_panel.toggle()<CR>", "Output pannel" }
lvim.builtin.which_key.mappings["tO"] = { "<cmd>lua require('neotest').output.open({enter = true})<CR>", "Output open" }
lvim.builtin.which_key.mappings["tf"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test File" }
lvim.builtin.which_key.mappings["ts"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }
lvim.builtin.which_key.mappings["tF"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test File DAP" }

lvim.builtin.which_key.mappings["gh"] = {
  name = "+Github",
  c = {
    name = "+Commits",
    c = { "<cmd>GHCloseCommit<cr>", "Close" },
    e = { "<cmd>GHExpandCommit<cr>", "Expand" },
    o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
    p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
    z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
  },
  i = {
    name = "+Issues",
    p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
  },
  l = {
    name = "+Litee",
    t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
  },
  r = {
    name = "+Review",
    b = { "<cmd>GHStartReview<cr>", "Begin" },
    c = { "<cmd>GHCloseReview<cr>", "Close" },
    d = { "<cmd>GHDeleteReview<cr>", "Delete" },
    e = { "<cmd>GHExpandReview<cr>", "Expand" },
    s = { "<cmd>GHSubmitReview<cr>", "Submit" },
    z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
  },
  p = {
    name = "+Pull Request",
    c = { "<cmd>GHClosePR<cr>", "Close" },
    d = { "<cmd>GHPRDetails<cr>", "Details" },
    e = { "<cmd>GHExpandPR<cr>", "Expand" },
    o = { "<cmd>GHOpenPR<cr>", "Open" },
    p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
    r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
    t = { "<cmd>GHOpenToPR<cr>", "Open To" },
    z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
  },
  t = {
    name = "+Threads",
    c = { "<cmd>GHCreateThread<cr>", "Create" },
    n = { "<cmd>GHNextThread<cr>", "Next" },
    t = { "<cmd>GHToggleThread<cr>", "Toggle" },
  },
}

-- binding for switching
-- lvim.builtin.which_key.mappings["C"] = {
--   -- name = "Python",
--   -- c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
-- }


vim.keymap.set({ "x", "o" }, "al", ":<C-u>norm! 0v$<cr>", { desc = "Line text object" })
vim.keymap.set({ "x", "o" }, "il", ":<C-u>norm! _vg_<cr>", { desc = "Line text object" })

vim.keymap.set({ "x", "o" }, "ae", ":<C-u>norm! mzggVG<CR>", { desc = "Entire buffer text object" })
vim.keymap.set({ "x", "o" }, "ie", ":<C-u>norm! mzggVG<CR>", { desc = "Entire buffer text object" })



lvim.builtin.which_key.mappings[" "] = { ":Telescope frecency workspace=CWD<CR>", "Telescope frequency workspace=CWD" }
lvim.builtin.which_key.mappings["T"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  T = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
