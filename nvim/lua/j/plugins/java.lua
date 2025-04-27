return {
    "mfussenegger/nvim-jdtls",
    ft = { "java" }, -- Solo se cargará en archivos Java
    config = function()
        local jdtls = require("jdtls")
        local home = os.getenv("HOME")

        local function setup_jdtls()
            local root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
            if not root_dir then
                return
            end

            local workspace_dir = home .. "/.cache/jdtls/workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

            local config = {
                cmd = { "jdtls" },
                root_dir = root_dir,
                workspace_dir = workspace_dir,
            }

            jdtls.start_or_attach(config)
        end

        setup_jdtls()
    end,
}
