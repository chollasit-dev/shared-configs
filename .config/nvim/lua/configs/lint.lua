local lint = require "lint"

lint.linters_by_ft = {
  bash = { "shellcheck" },
  dockerfile = { "hadolint" },
  gitcommit = { "gitlint", "commitlint" },
  go = { "golangci-lint" },
  javascript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  markdown = { "markdownlint-cli2" },
  python = { "ruff" },
  sh = { "shellcheck" },
  sql = { "sqlfluff" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  zsh = { "shellcheck" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    lint.try_lint()

    -- You can call `try_lint` with a linter name or a list of names to always
    -- run specific linters, independent of the `linters_by_ft` configuration
    -- lint.try_lint "cspell"
  end,
})
