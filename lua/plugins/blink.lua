return {
    'saghen/blink.cmp',
    dependencies = {
        "xzbdmw/colorful-menu.nvim"
    },

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap     = { preset = 'enter' },

        appearance = {
            nerd_font_variant = 'mono'
        },

        completion = {
            documentation = { auto_show = false },
            ghost_text = { enabled = true },

            menu = {
                draw = {
                    columns = { { "kind_icon" }, { "label", gap = 1 } },
                    components = {
                        kind_icon = {
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end
                        },
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end
                        },
                    }
                }
            }
        },

        sources    = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        fuzzy      = { implementation = "prefer_rust_with_warning" },
        cmdline    = {
            keymap = { preset = 'cmdline' },
            completion = { menu = { auto_show = true } },
        },

        term       = {
            enabled    = true,
            keymap     = { preset = 'cmdline' },
            menu       = { auto_show = true },
            ghost_text = { enabled = true },
        }
    },
    opts_extend = { "sources.default" }
}
