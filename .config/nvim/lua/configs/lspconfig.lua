-- defaults: lua_lsp
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
  "astro",
  "bashls",
  "cssls",
  "docker_compose_language_service",
  "dockerls",
  "eslint",
  "html",
  "hyprls",
  "jsonls",
  "just",
  "nginx_language_server",
  "nil_ls",
  "nixd",
  "pyright",
  "ruff",
  "sqlls",
  "sqls",
  "tailwindcss",
  "taplo",
  "ts_ls",
  "yamlls",
}
vim.lsp.config("*", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
})
for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end

-- go
vim.lsp.config("gopls", {
  settings = {
    gopls = {
      usePlaceholders = true,
      analyses = {
        unusedParams = true,
      },
    },
  },
})
vim.lsp.enable "gopls"

-- haskell
-- NOTE: expected standard GHC bin name `ghc`
-- installation via `ghcup` should aware of this

vim.lsp.config("hls", {
  cmd = { "haskell-language-server-9.12.2~2.11.0.0", "--lsp" },
  filetypes = { "haskell", "lhaskell", "cabal" },
})
vim.lsp.enable "hls"
