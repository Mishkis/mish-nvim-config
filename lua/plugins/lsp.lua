local keys = require("helpers.keys")

local servers = {}

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

            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(servers)
            })

            local capabilites = require("cmp_nvim_lsp").default_capabilities()
            require("mason-lspconfig").setup_handlers {
                function(server_name)
                    local config = {
                        on_attach = on_attach,
                        settings = servers[server_name],
                        capabilites = capabilites,
                    }

                    -- jdtls is setup by different plugin, see below.
                    if server_name ~= "jdtls" then
                        require("lspconfig")[server_name].setup(config)
                    end
                end,
            }
        end,
    },
}
