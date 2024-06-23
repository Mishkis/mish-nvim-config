local keys = require("helpers/keys")

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
            keys.set("<Leader>h", vim.lsp.buf.hover, "[h]over word")
            keys.set("<Leader>d", vim.lsp.buf.definition, "Goto [d]efinition")
            keys.set("<Leader>td", vim.lsp.buf.type_definition, "Goto [t]ype [d]efiniton")
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
