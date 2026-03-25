require("nvchad.configs.lspconfig").defaults()

local base = require("nvchad.configs.lspconfig")

local servers = { "html", "cssls", "hls", "texlab", "clangd" }

-- Configuración base para todos
for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    on_attach = base.on_attach,
    on_init = base.on_init,
    capabilities = base.capabilities,
  })
end

-- HLS
vim.lsp.config("hls", {
  on_attach = base.on_attach,
  on_init = base.on_init,
  capabilities = base.capabilities,
  filetypes = { "haskell", "lhaskell" },
  settings = {
    haskell = {
      checkProject = true,
      formattingProvider = "fourmolu",
      maxCompletions = 41,
    },
  },
})

-- texlab
vim.lsp.config("texlab", {
  on_attach = base.on_attach,
  capabilities = base.capabilities,
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        onSave = false,
      },
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
    },
  },
})

-- clangd
vim.lsp.config("clangd", {
  on_attach = base.on_attach,
  on_init = base.on_init,
  capabilities = base.capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never",
    "--completion-style=detailed",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})

-- Activar todos
vim.lsp.enable(servers)
