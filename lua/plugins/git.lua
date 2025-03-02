return {
    {
        "tpope/vim-fugitive",
        keys = {
            { "<Leader>ga", "<cmd>Git add *<cr>",  desc = "[g]it [a]dd all." },
            { "<Leader>gs", "<cmd>Git status<cr>", desc = "[g]it [s]tatus." },
            { "<Leader>gc", "<cmd>Git commit<cr>", desc = "[g]it [c]ommit." },
            { "<Leader>gp", "<cmd>Git push<cr>",   desc = "[g]it [p]ush." },
            { "<Leader>gd", "<cmd>Git diff<cr>",   desc = "[g]it [d]iff." },
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            -- Column diff is already implemented in infolines.
            -- signcolumn = false,
            word_diff = true,
        },
        config = true,
        lazy = false,
        keys = {
            { "<Leader>gw", "<Cmd>Gitsigns toggle_word_diff<cr>", desc = "[g]it toggle [w]ord diff" },
            { "<Leader>gr", "<Cmd>Gitsigns reset_hunk<cr>",       desc = "[g]it hunk [r]eset" },
            { "<Leader>gh", "<Cmd>Gitsigns preview_hunk<cr>",     desc = "[g]it [h]unk preview" },
            { "<Leader>gb", "<Cmd>Gitsigns blame<cr>",            desc = "[g]it [b]lame" },
        }
    }
}
