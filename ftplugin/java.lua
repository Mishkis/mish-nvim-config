local config = {
    cmd = { vim.fn.stdpath("data") .. "\\mason\\packages\\jdtls\\bin\\jdtls.bat" },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),

    init_options = {
        bundles = {
            vim.fn.stdpath("data") ..
            "/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.0.jar"
        },
    }
}

require("jdtls").start_or_attach(config)
