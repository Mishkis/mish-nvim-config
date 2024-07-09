return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        skip_confirm_for_simple_edits = true
    },
    keys = {
        { "<Leader>e", "<cmd>Oil<cr>", desc = "[e]dit with oil in current file's directory." }
    },
    cmd = "Oil"
}
