local col = require("theme.colors")
local hl = require("helpers.highlights")

return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "dcampos/nvim-snippy",
        "dcampos/cmp-snippy",
    },

    config = function()
        -- Set up nvim-cmp.
        local cmp = require("cmp")

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("snippy").expand_snippet(args.body)
                end,
            },

            window = {
                completion = {
                    winhighlight = "Normal:PMenu,CursorLine:PMenuSel",
                    border = "rounded",
                },
            },

            mapping = {
                ["<CR>"] = function(fallback)
                    if cmp.visible() then
                        cmp.confirm({ select = true })
                    else
                        fallback()
                    end
                end,

                ["<Tab>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end,

                ["<Down>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end,

                ["<Up>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end,

                --[c]lear selection
                ["<C-c>"] = function(fallback)
                    if cmp.visible() then
                        cmp.abort()
                    else
                        fallback()
                    end
                end,
            },

            sources = cmp.config.sources({
                { name = "snippy" },
                { name = "lazydev" },
                { name = "nvim_lsp" },
                { name = "buffer" },
            }),

            experimental = {
                ghost_text = true
            },
        })

        -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
        -- Set configuration for specific filetype.
        --[[ cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
                { name = "git" },
            }, {
                { name = "buffer" },
            })
        })
        require("cmp_git").setup() ]] --

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" }
            }
        })

        -- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" }
            }, {
                { name = "cmdline" }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })

        hl.set("CmpItemKindDefault", { fg = col.lightPink })
        hl.set("CmpItemKindFunctionDefault", { link = "@keyword.function" })
        hl.set("CmpItemKindSnippetDefault", { fg = col.transPink })
        hl.set("CmpItemKindPropertyDefault", { link = "@property" })
        hl.set("CmpItemKindVariableDefault", { link = "@variable" })
        hl.set("CmpItemKindTextDefault", { link = "Comment" })
        -- cmp_nvim_lsp is set up in lsp_config.
    end,
}
