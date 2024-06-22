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
        vim.keymap.set("n", "<Leader>h", vim.lsp.buf.hover, { desc = "[h]over word" })
        vim.keymap.set("n", "<Leader>d", vim.lsp.buf.definition, { desc = "Goto [d]efinition" })
        vim.keymap.set("n", "<Leader>td", vim.lsp.buf.type_definition, { desc = "Goto [t]ype [d]efiniton" })

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
