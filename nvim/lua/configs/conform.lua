local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    htmldjango = { "prettier" },
    haskell = { "fourmolu" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    java = { "google-java-format" }, 
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
