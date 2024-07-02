return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "mfussenegger/nvim-dap-python",
    },

    config = function()
        require("dap-python").setup("python")
    end
}
