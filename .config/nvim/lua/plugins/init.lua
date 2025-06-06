return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
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
        "html",
        "javascript",
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

  -- mason related
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

  -- debugger
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

  -- database UI
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

  -- markup qol
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

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- neovim qol
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
  -- render markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    config = function()
      require("render-markdown").setup {
        completions = { lsp = { enabled = true } },
      }
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    event = { "bufEnter" },
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
  -- ai
  {
    "sourcegraph/sg.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    lazy = false,
    opts = {},
  },
  -- color picker
  { "nvzone/volt", lazy = true },
  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
  },
}
