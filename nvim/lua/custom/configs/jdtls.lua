local jdtls = require("jdtls")

-- Configuración base de jdtls
local config = {
    cmd = { 'jdtls' },
    root_dir = jdtls.setup.find_root({'.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle'}),
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-24",
                        path = "/usr/lib/jvm/java-24-openjdk",
                    }
                }
            }
        }
    },
    
    -- AÑADE ESTA PARTE PARA LOS MAPEOS Y CAPABILIDADES
    on_attach = function(client, bufnr)
        -- Mapeos específicos para Java
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        
        -- Ver documentación (Javadoc)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        
        -- Navegación
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        
        -- Acciones de código
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
        
        -- Información de firma
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        
        -- Formateo
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format({ async = true })
        end, bufopts)
    end,
    
    -- AÑADE LAS CAPACIDADES PARA MEJOR INTEGRACIÓN
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

-- Función para iniciar jdtls
local function start_jdtls()
    local root_dir = jdtls.setup.find_root({'.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle'})
    if root_dir then
        config.root_dir = root_dir
        jdtls.start_or_attach(config)
    end
end

-- Configurar autocmd para archivos Java
vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function(args)
        local bufnr = args.buf
        -- Verificar si jdtls ya está activo en este buffer
        local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
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

-- También iniciar cuando ya hay un buffer Java abierto al cargar nvim
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.java",
    callback = function(args)
        if vim.bo[args.buf].filetype == "java" then
            start_jdtls()
        end
    end
})
