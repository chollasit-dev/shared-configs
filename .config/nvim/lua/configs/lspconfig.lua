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
  "html",
  "jsonls",
  "nginx_language_server",
  "nil_ls",
  "pyright",
  "ruff",
  "sqlls",
  "sqls",
  "tailwindcss",
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

-- external lsp

-- nix
-- Neovim v0.11+
vim.lsp.config["nixd"] = {
  cmd = { "/home/user/.nix-profile/bin/nixd" },
  filetypes = { "nix" },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    nixpkgs = {
      expr = "import <nixpkgs> {}",
    },
  },
}
vim.lsp.enable "nixd"
