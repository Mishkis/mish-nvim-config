return {
    "tpope/vim-fugitive",
    keys = {
        { "<Leader>ga", "<cmd>Git add *<cr>",  desc = "[g]it [a]dd all." },
        { "<Leader>gs", "<cmd>Git status<cr>", desc = "[g]it [s]tatus." },
        { "<Leader>gc", "<cmd>Git commit<cr>", desc = "[g]it [c]ommit." },
        { "<Leader>gp", "<cmd>Git push<cr>",   desc = "[g]it [p]ush." },
        { "<Leader>gd", "<cmd>Git diff<cr>",   desc = "[g]it [d]iff." },
    }
}
