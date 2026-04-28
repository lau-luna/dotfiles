return {
  "mfussenegger/nvim-dap",
  config = function()
    local map = vim.keymap.set
    local dap = require("dap")
    local mason_path = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"
    local netcoredbg_adapter = {
      type = "executable",
      command = mason_path,
      args = { "--interpreter=vscode" },
    }
    dap.adapters.netcoredbg = netcoredbg_adapter
    dap.adapters.coreclr = netcoredbg_adapter
    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "LAUNCH directly from nvim",
        request = "launch",
        program = function()
          return require("dap-dll-autopicker").build_dll_path()
        end
      },
    }
    dap.configurations.java = {
      {
        type = "java",
        request = "launch",
        name = "Debug (Launch) - Current File",
        mainClass = function()
          return vim.fn.input("Main class (e.g. com.example.Main): ", "")
        end,
      },
      {
        type = "java",
        request = "attach",
        name = "Debug (Attach) - Remote",
        hostName = "127.0.0.1",
        port = 5005,
      },
    }
    map("n", "<F7>", dap.step_out, { desc = "DAP: Step out" })
    map("n", "<F8>", dap.step_into, { desc = "DAP: Step into" })
    map("n", "<F9>", dap.step_over, { desc = "DAP: Step over" })
    map("n", "<F10>", dap.continue, { desc = "DAP: Continue/Start" })
    map("n", "<F11>", dap.toggle_breakpoint, { desc = "DAP: Toggle breakpoint" })
    map("n", "<F12>", dap.run_last, { desc = "DAP: Run last" })
    map("n", "<leader>dr", dap.repl.open, { desc = "DAP: REPL open" })
  end,
}
