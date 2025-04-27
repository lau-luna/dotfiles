return {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
        local jdtls = require("jdtls")
        local home = os.getenv("HOME")

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "java",
            callback = function()
                local root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
                if not root_dir then
                    return
                end

                local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
                vim.fn.mkdir(workspace_folder, "p") -- crea la carpeta si no existe

                local config = {
                    cmd = { "jdtls" },
                    root_dir = root_dir,
                    workspace_folder = workspace_folder,
                    settings = {
                        java = {},
                    },
                }

                jdtls.start_or_attach(config)
            end,
        })
    end,
}
