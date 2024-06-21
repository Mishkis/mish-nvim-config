local servers = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = {"vim"}
                }
            }
        }
    }
}

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", lazy = false, config = true },
        "williamboman/mason-lspconfig.nvim",
    },

    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers)
        })

        require("mason-lspconfig").setup_handlers {
            function (server_name)
                local config = servers[server_name]
                if config == nil then
                    config = {}
                end
                require("lspconfig")[server_name].setup(config)
            end,
        }

    end,
}
