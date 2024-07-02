local keys = require("helpers.keys")

return {
    "mfussenegger/nvim-dap",
    dependencies = {
        -- Extensions
        "rcarriga/nvim-dap-ui",
        { "theHamsta/nvim-dap-virtual-text", dependencies = { "nvim-neotest/nvim-nio" } },

        -- Language specific
        "mfussenegger/nvim-dap-python",
    },

    config = function()
        local dap = require("dap")

        require("nvim-dap-virtual-text").setup({})
        require("dapui").setup()

        require("dap-python").setup("python")

        keys.set("<Leader>dc", function() dap.continue() end, "[d]ap [c]ontinue.")
        keys.set("<Leader>db", function() dap.toggle_breakpoint() end, "[d]ap toggle [b]reakpoint.")
    end
}