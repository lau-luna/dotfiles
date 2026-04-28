require("nvchad.configs.lspconfig").defaults()

local base = require("nvchad.configs.lspconfig")

local servers = { "html", "cssls", "hls", "texlab", "clangd", "ts_ls", "eslint" }

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

-- Javascript / Typescript
vim.lsp.config("ts_ls", {
  on_attach = base.on_attach,
  on_init = base.on_init,
  capabilities = base.capabilities,
  settings = {
    javascript = {
      format = { enable = false }, -- usás prettier
    },
    typescript = {
      format = { enable = false },
    },
  },
})

vim.lsp.config("html", {
  on_attach = base.on_attach,
  capabilities = base.capabilities,
  filetypes = { "html", "htmldjango" },
})

vim.lsp.config("cssls", {
  on_attach = base.on_attach,
  capabilities = base.capabilities,
  settings = {
    css = { validate = true },
    scss = { validate = true },
  },
})


vim.lsp.config("eslint", {
  on_attach = base.on_attach,
  capabilities = base.capabilities,
})
-- Activar todos
vim.lsp.enable(servers)

-- lua_ls
vim.lsp.config("lua_ls", {
  on_attach = base.on_attach,
  on_init = base.on_init,
  capabilities = base.capabilities,
  cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/lua-language-server") },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.enable("lua_ls")


vim.lsp.config("ltex", {
  on_attach = base.on_attach,
  capabilities = base.capabilities,
  filetypes = { "html", "markdown", "text" },
  settings = {
    ltex = {
      language = "en-US,es-AR",

      -- 🔥 CLAVE
      disabledRules = {
        ["en-US"] = {
          "HTML_TAG",
        },
      },

      -- 👇 ignorar markup HTML
      additionalRules = {
        enablePickyRules = false,
      },

      -- 👇 esto es lo importante posta
      checkFrequency = "save",

      -- 👇 magia negra útil
      ignoredPatterns = {
        "<[^>]+>", -- ignora TODO lo que sea tag HTML
      },
    },
  },
})


local ltex_active = false

vim.keymap.set("n", "<leader>se", function()
  ltex_active = not ltex_active

  if ltex_active then
    vim.lsp.enable("ltex")
    print("LTeX ON")
  else
    for _, client in pairs(vim.lsp.get_active_clients()) do
      if client.name == "ltex" then
        client.stop()
      end
    end
    print("LTeX OFF")
  end
end)
