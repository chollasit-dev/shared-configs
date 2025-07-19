local opts = {
  formatters_by_ft = {
    ["markdown.mdx"] = { "prettierd", "markdownlint-cli2", "markdown-toc" },
    bash = { "shfmt" },
    css = { "prettierd" },
    gitconfig = { "shfmt" },
    go = { "goimports-reviser", "golines" },
    html = { "prettierd" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    json = { "prettierd" },
    lua = { "stylua" },
    markdown = { "prettierd", "markdownlint-cli2", "markdown-toc" },
    nginx = { "nginxfmt" },
    nix = { "alejandra" },
    py = { "ruff" },
    sh = { "shfmt" },
    sql = { "sql_formatter" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    yaml = { "prettierd" },
    zsh = { "shfmt" },
  },

  -- If this is set, Conform will run the formatter on save.
  -- It will pass the table to conform.format().
  -- This can also be a function that returns the table.
  format_on_save = {
    -- I recommend these options. See :help conform.format for details.
    lsp_format = "fallback",
    timeout_ms = 500,
  },

  -- To enable formatting code inside markdown code block based on languages not supported by Prettier
  -- https://github.com/stevearc/conform.nvim/blob/master/doc/formatter_options.md#injected
}

return opts
