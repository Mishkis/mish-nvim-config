local keys = require("helpers.keys")

return {
    'stevearc/oil.nvim',
    opts = {
        skip_confirm_for_simple_edits = true
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        require("oil").setup()

        keys.set("<Leader>e", "<cmd>Oil<cr>", "[e]dit with oil in current file's directory.")
    end
}
