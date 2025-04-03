return {
    "mfussenegger/nvim-jdtls",
    ft = { "java" }, -- Solo se cargará en archivos Java
    config = function()
        local jdtls = require("jdtls")
        local home = os.getenv("HOME")
        local workspace_dir = home .. "/.cache/jdtls/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

        local config = {
            cmd = { "jdtls" }, -- Usa el ejecutable de Mason si está instalado
            root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
        }

        jdtls.start_or_attach(config)
    end,
}
