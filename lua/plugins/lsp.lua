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
            checkOnSave = {
                command = "clippy"
            }
        },
    },
    ["lua_lus"] = {}
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

            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()
            local on_attach = function()
                keys.set("<Leader>h", vim.lsp.buf.hover, "[h]over word")
            end

            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = vim.tbl_keys(servers)
            })

            local capabilites = require("cmp_nvim_lsp").default_capabilities()
            mason_lspconfig.setup_handlers {
                function(server_name)
                    local config = {
                        on_attach = on_attach,
                        settings = servers[server_name],
                        capabilites = capabilites,
                        inlay_hints = { enable = true }
                    }

                    require("lspconfig")[server_name].setup(config)
                end,
            }
        end,
    },
}
