return {
  {
    "<leader>du",
    function()
      require('dapui').toggle {}
    end,
    desc = "Dap UI toggle",
  },
  {
    "<leader>de",
    function()
      require('dapui').eval()
    end,
    desc = "Dap UI eval",
    mode = { "n", "v" },
  },
}
