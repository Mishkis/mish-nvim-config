return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<Leader>F",
            function()
                require("conform").format({ async = true, lsp_format = "fallback", stop_after_first = true })
            end,
            mode = "",
            desc = "[F]ormat buffer.",
        },
    },

    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            javascript = { "prettierd", "prettier" },
            java = { "google-java-format" },
            rust = { "rustfmt" },
        },

        format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
    },
}
