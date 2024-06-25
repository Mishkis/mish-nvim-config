local keys = require("helpers.keys")

return {
    "tpope/vim-fugitive",
    config = function()
        keys.set("<Leader>ga", "<cmd>Git add *<cr>", "[g]it [a]dd all.")
        keys.set("<Leader>gs", "<cmd>Git status<cr>", "[g]it [s]tatus.")
        keys.set("<Leader>gc", "<cmd>Git commit<cr>", "[g]it [c]ommit.")
        keys.set("<Leader>gp", "<cmd>Git push<cr>", "[g]it [p]ush.")
        keys.set("<Leader>gd", "<cmd>Git diff<cr>", "[g]it [d]iff.")
    end
}
