return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    local helpers = require("null-ls.helpers")

    local openjml = {
      name = "openjml",
      method = null_ls.methods.DIAGNOSTICS,
      filetypes = { "java" },
      generator = helpers.generator_factory({
        command = "openjml",
        args = { "-esc", "$FILENAME" },
        from_stderr = true,
        format = "line",
        on_output = helpers.diagnostics.from_pattern(
          ":(%d+):(%d+): error: (.*)",
          { "row", "col", "message" },
          { severity = vim.diagnostic.severity.ERROR }
        ),
      }),
    }

    null_ls.setup({
      sources = { openjml },
    })
  end,
}
