return function()
  vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

  local dap = require "dap"

  -- javascript, typescript
  local js_debug_adapter = vim.fn.stdpath "data" .. "/mason/bin/js-debug-adapter"

  if js_debug_adapter ~= "" then
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "8123", -- should be valid port like `8123`
      executable = {
        command = "js-debug-adapter",
        -- args = { "/path/to/js-debug/src/dapDebugServer.js", "${port}" },
      },
    }
  end

  for _, language in ipairs { "javascript", "typescript" } do
    dap.configurations[language] = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
        runtimeExecutable = "node",
      },
    }
  end

  -- TODO: setup dap config by vscode launch.json file
  local vscode = require "dap.ext.vscode"
  local json = require "plenary.json"
  vscode.json_decode = function(str)
    return vim.json.decode(json.json_strip_comments(str))
  end
end
