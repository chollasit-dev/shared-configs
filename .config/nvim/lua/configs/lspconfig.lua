-- defaults: lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- TODO: migrate remaining to newer version of configuration.
local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
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

-- lsps with defaults
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- language specific

-- go
lspconfig.gopls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    gopls = {
      usePlaceholders = true,
      analyses = {
        unusedParams = true,
      },
    },
  },
}

-- haskell

-- NOTE: expected standard GHC bin name `ghc`
-- installation via `ghcup` should aware of this

vim.lsp.config("hls", {
  cmd = { "haskell-language-server-9.12.2~2.11.0.0", "--lsp" },
  filetypes = { "haskell", "lhaskell", "cabal" },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
})
vim.lsp.enable "hls"
