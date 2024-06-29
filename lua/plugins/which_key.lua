return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,

    opts = {
        triggers_blacklist = {
            n = { "v" }
        }
    },

    config = function(opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register({
            f = { name = "[f]ind using Telescope." },
            t = { name = "Goto [t]ype [d]efinition." },
            s = { name = "[s]elect using treesitter textobjects." },
            g = { name = "[g]it commands." },
        }, { prefix = "<Leader>" })
    end
}
