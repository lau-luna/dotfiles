return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio",  },
  event = "VeryLazy",
  config = function()
    local map = vim.keymap.set
    local dapui = require("dapui")
    local dap = require("dap")
    -- open the ui as soon as we are debugging
    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    vim.fn.sign_define('DapBreakpoint',
      {
        text = '⚪',
        texthl = 'DapBreakpointSymbol',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint'
      })
    vim.fn.sign_define('DapStopped',
      {
        text = '🔴',
        texthl = 'yellow',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint'
      })
    vim.fn.sign_define('DapBreakpointRejected',
      {
        text = '⭕',
        texthl = 'DapStoppedSymbol',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint'
      })
    dapui.setup({
      expand_lines = true,
      controls = { enabled = false },
      floating = { border = "rounded" },
      render = {
        max_type_length = 60,
        max_value_lines = 200,
      },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 1.0 },
          },
          size = 15,
          position = "bottom",
        },
      },
    })
    map("n", "<leader>du",  dapui.toggle,                                          { desc = "DAP UI toggle" })
    map({ "n", "v" }, "<leader>dw", function() dapui.eval(nil, { enter = true }) end, { desc = "DAP Add word under cursor to Watches" })
    map({ "n", "v" }, "Q", function() dapui.eval() end,                            { desc = "DAP Peek" })
    local neotest = require("neotest")
    map("n", "<leader>dt",  function() neotest.run.run({ strategy = "dap" }) end,  { desc = "Debug nearest test" })
    map("n", "<F6>",        function() neotest.run.run({ strategy = "dap" }) end,  { desc = "Debug nearest test" })
  end,
}
