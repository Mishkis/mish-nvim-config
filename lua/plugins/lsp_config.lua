local servers = {
    lua_ls = {
        Lua = {
            diagnostics = {
                globals = {"vim"}
            }
        }
    }
}

return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",
    },

    config = function()
        local keybindings = function()
            vim.keymap.set("n", "<Leader>h", vim.lsp.buf.hover, { desc = "[h]over word" })
            vim.keymap.set("n", "<Leader>d", vim.lsp.buf.definition, { desc = "Goto [d]efinition" })
            vim.keymap.set("n", "<Leader>td", vim.lsp.buf.type_definition, { desc = "Goto [t]ype [d]efiniton" })
        end

        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers)
        })

        require("mason-lspconfig").setup_handlers {
            function (server_name)
                local config = {
                    on_attach = keybindings,
                    settings = servers[server_name]
                }

                require("lspconfig")[server_name].setup(config)
            end,
        }
    end,
}
