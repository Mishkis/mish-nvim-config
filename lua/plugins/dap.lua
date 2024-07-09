return {
    "mfussenegger/nvim-dap",
    dependencies = {
        -- Extensions
        { "rcarriga/nvim-dap-ui",            opts = {} },
        { "theHamsta/nvim-dap-virtual-text", dependencies = { "nvim-neotest/nvim-nio" }, opts = {} },

        -- Language specific
        {
            "mfussenegger/nvim-dap-python",
            ft = "py",
            config = function()
                require("dap-python").setup("python")
            end
        },
    },
    keys = {
        {
            "<Leader>dc",
            function()
                require("dapui").open()
                require("dap").continue()
            end,
            desc = "[d]ap [c]ontinue"
        },
        { "<Leader>db", function() require("dap").toggle_breakpoint() end, "[d]ap toggle [b]reakpoint." },
        { "<Leader>dC", function() require("dap").clear_breakpoints() end, "[d]ap [C]lear breakpoints." },
        { "<Leader>du", function() require("dapui").toggle() end,          "[d]ap toggle [u]i." },
    },
    -- config = function()
    --     require("dap-python").setup("python")
    -- end
}
