local jdtls = require("jdtls")

-- DAP bundles
local bundles = {
  vim.fn.glob(
    vim.fn.stdpath("data") .. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
    true
  ),
}
vim.list_extend(bundles, vim.split(
  vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/java-test/extension/server/*.jar", true),
  "\n"
))

local config = {
  cmd = {
    "env",
    "JAVA_HOME=" .. vim.fn.expand("~/.sdkman/candidates/java/21.0.7-tem"),
    vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls"),
  },
  root_dir = jdtls.setup.find_root({ '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }),
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-21",
            path = "/home/lau/.sdkman/candidates/java/21.0.7-tem",
          }
        }
      }
    }
  },

  -- ADD bundles here
  init_options = {
    bundles = bundles,
  },

  on_attach = function(client, bufnr)
    -- Setup DAP
    jdtls.setup_dap({ hotcodereplace = "auto" })
    require("jdtls.dap").setup_dap_main_class_configs()

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, bufopts)

    vim.keymap.set("n", "<leader>jt", function()
      local test_name = vim.fn.expand("<cword>")
      local root = vim.fn.getcwd()

      vim.fn.jobstart({
        "bash", "-c",
        "cd " .. root .. " && ./gradlew test --tests '*." .. test_name .. "' --debug-jvm --rerun-tasks"
      }, { detach = false })

      vim.notify("Waiting for gradle...", vim.log.levels.INFO)

      local attempts = 0
      local function try_attach()
        attempts = attempts + 1
        if attempts > 15 then
          vim.notify("Timeout: gradle no levantó", vim.log.levels.ERROR)
          return
        end

        -- Verifica si el puerto 5005 está escuchando
        local port_open = vim.fn.system("ss -tlnp | grep 5005")
        if port_open == "" then
          vim.notify("Intento " .. attempts .. "...", vim.log.levels.INFO)
          vim.defer_fn(try_attach, 2000)
          return
        end

        vim.notify("Conected debugger! Time to hunt down bugs! ( -_•)▄︻デ══━一", vim.log.levels.INFO)
        require("dap").run({
          type = "java",
          request = "attach",
          name = "Auto attach",
          hostName = "127.0.0.1",
          port = 5005,
        })
      end

      vim.defer_fn(try_attach, 3000)
    end, { desc = "Java: debug test bajo cursor", buffer = bufnr })
  end,

  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

local function start_jdtls()
  local root_dir = jdtls.setup.find_root({ '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' })
  if root_dir then
    config.root_dir = root_dir
    jdtls.start_or_attach(config)
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function(args)
    local bufnr = args.buf
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    local has_jdtls = false
    for _, client in ipairs(clients) do
      if client.name == "jdtls" then
        has_jdtls = true
        break
      end
    end
    if not has_jdtls then
      start_jdtls()
    end
  end
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.java",
  callback = function(args)
    if vim.bo[args.buf].filetype == "java" then
      start_jdtls()
    end
  end
})
