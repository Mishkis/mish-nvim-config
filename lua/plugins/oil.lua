local keys = require("helpers.keys")

return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        skip_confirm_for_simple_edits = true
    },
    config = function()
        require("oil").setup()

        keys.set("<Leader>e", "<cmd>Oil<cr>", "[e]dit with oil in current file's directory.")
    end
}
