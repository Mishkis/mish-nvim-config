local languages = { "c", "lua", "vim", "vimdoc", "query", "python", "c_sharp", "javascript", "markdown", "toml", "json",
    "rust" }

return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    main = "nvim-treesitter.configs",
    lazy = false,
    opts = {
        ensure_installed = languages,

        -- If in a file that you don't have language for, install it
        auto_install = true,

        highlight = {
            enable = true,
        },

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<Leader>ss", -- set to `false` to disable one of the mappings
                node_incremental = "<Leader>si",
                scope_incremental = "<Leader>sc",
                node_decremental = "<Leader>sd",
            },
        },

        textobjects = {
            select = {
                enable = true,

                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,

                keymaps = {
                    ["ap"] = "@parameter.outer",
                    ["ip"] = "@parameter.inner",
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                    ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                },

                selection_modes = {
                    ['@parameter.outer'] = 'v', -- charwise
                    ['@function.outer'] = 'V',  -- linewise
                    ['@class.outer'] = '<c-v>', -- blockwise
                },
                include_surrounding_whitespace = true,
            },
        },
    }
}
