return {
  --------------------------
  --- syntax highlighting ---
  --------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "bash",
        "css",
        "editorconfig",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "goctl",
        "godot_resource",
        "gomod",
        "gosum",
        "gotmpl",
        "haskell",
        "html",
        "javascript",
        "just",
        "lua",
        "markdown",
        "markdown_inline",
        "nix",
        "python",
        "regex",
        "sql",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
      },
    },
  },
  -- kitty terminal syntax
  {
    "fladson/vim-kitty",
    ft = "kitty",
    -- tag = "*", -- if select a tagged version
  },

  ---------------------
  --- mason related ---
  ---------------------
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      require "configs.lint"
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  ---------------------
  --- file explorer ---
  ---------------------
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      local HEIGHT_RATIO = 0.8
      local WIDTH_RATIO = 0.7
      require("nvim-tree").setup {
        view = {
          centralize_selection = true,
          relativenumber = true,
          float = {
            enable = true,
            open_win_config = function()
              local screen_w = vim.opt.columns:get()
              local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
              local window_w = screen_w * WIDTH_RATIO
              local window_h = screen_h * HEIGHT_RATIO
              local window_w_int = math.floor(window_w)
              local window_h_int = math.floor(window_h)
              local center_x = (screen_w - window_w) / 2
              local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
              return {
                border = "rounded",
                relative = "editor",
                row = center_y,
                col = center_x,
                width = window_w_int,
                height = window_h_int,
              }
            end,
          },
          width = function()
            return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
          end,
        },
        update_focused_file = {
          enable = true,
          update_root = {
            enable = false,
            ignore_list = {},
          },
          exclude = false,
        },
      }
    end,
  },

  --------------------
  --- language qol ---
  --------------------
  -- go
  {
    "leoluz/nvim-dap-go",
    dependencies = "mfussenegger/nvim-dap",
    ft = { "go" },
    opts = {},
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      -- if needed floating test term
      "ray-x/guihua.lua",
    },
    build = function()
      -- if needed to install/update all binaries
      require("go.install").update_all_sync()
    end,
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
  },
  -- haskell
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^6", -- recommended
    lazy = false, -- this plugin is already lazy
  },
  -- python
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      -- using uv
      require("dap-python").setup "uv"
    end,
    dependencies = "mfussenegger/nvim-dap",
    event = { "bufEnter *.py" },
  },
  -- markup
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    opts = {},
  },

  ----------------
  --- debugger ---
  ----------------
  {
    "mfussenegger/nvim-dap",
    config = require "configs.dap.config",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        config = require "configs.dap-ui.config",
        keys = require "configs.dap-ui.keys",
      },
      "nvim-neotest/nvim-nio",
      {
        -- virtual text for debugger display kinda like ai suggestion
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },
    keys = require "configs.dap.keys",
  },

  ----------------
  --- database ---
  ----------------
  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_use_nvim_notify = 1
      vim.g.db_ui_winwidth = 30
    end,
    keys = {
      {
        "<leader>dd",
        "<cmd>DBUI<CR>",
        desc = "toggle DBUI",
      },
    },
  },

  ------------------
  --- editor qol ---
  ------------------
  -- git
  {
    "NeogitOrg/neogit",
    config = function()
      require "configs.neogit"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    lazy = false,
  },
  -- floating terminal
  {
    "numToStr/FTerm.nvim",
    opts = {
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
      ---Map of environment variables extending the current environment
      ---See `:h jobstart-options`
      ---@type table<string,string>|nil
      env = nil,
    },
  },
  -- todo
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  -- notify popup
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require "configs.noice"
    end,
    event = "VeryLazy",
  },
  -- copilot
  {
    "zbirenbaum/copilot.lua",
    build = ":Copilot auth",
    -- event = "BufReadPost",
    lazy = true,
    opts = {
      panel = {
        enabled = false,
      },
      suggestion = {
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 100,
      },
      filetypes = {
        gitcommit = true,
        help = true,
        markdown = true,
      },
    },
  },
  -- render markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown", "Avante" },
    lazy = false,
    opts = {
      completions = { lsp = { enabled = true } },
      file_types = { "markdown", "Avante" },
    },
  },
  -- render whitespace
  {
    "mcauley-penney/visual-whitespace.nvim",
    config = function()
      -- either in color scheme or in plugin config.
      vim.api.nvim_set_hl(0, "VisualNonText", { fg = "#727376", background = "#57575A" })
    end,
    event = "ModeChanged *:[vV\22]",
    opts = {
      highlight = {
        link = "*",
      },
    },
  },

  ------------------------------
  --- external interactivity ---
  ------------------------------
  -- tmux
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<CR>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<CR>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<CR>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<CR>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<CR>" },
    },
  },
}
