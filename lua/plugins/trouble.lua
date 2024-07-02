return {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
        {
            "<leader>tt",
            "<cmd>Trouble diagnostics toggle focus=true<cr>",
            desc = "[t]oggle [t]rouble diagnostics.",
        },
        {
            "<leader>tT",
            "<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>",
            desc = "[t]oggle [T]rouble diagnostics in current buffer.",
        },
        {
            "<leader>ts",
            "<cmd>Trouble symbols toggle focus=true<cr>",
            desc = "[t]oggle trouble [s]ymbols.",
        },
    },
}
