local keys = require("helpers.keys")

local servers = {
    ["rust_analyzer"] = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
            checkOnSave = true
        },
    },
    ["lua_ls"] = {},
}

return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            { "williamboman/mason.nvim", config = true },
            "williamboman/mason-lspconfig.nvim",

            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = { library = {} }
            },

            "saghen/blink.cmp"
        },

        keys = {
            { "<Leader>h", vim.lsp.buf.hover, desc = "[h]over word" }
        },

        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = vim.tbl_keys(servers)
            })

            local capabilites = require("blink.cmp").get_lsp_capabilities()

            for server, config in pairs(servers) do
                vim.lsp.config(server, {
                    capabilites = capabilites,
                    inlay_hints = { enable = true },
                    settings = config
                })
            end
        end,
    },
}
