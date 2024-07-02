return {
    "folke/todo-comments.nvim",
    dependencies = {
        "folke/todo-comments.nvim",
        "nvim-telescope/telescope.nvim"
    },
    opts = {
        signs = false
    },

    cmd = "TodoTelescope",
    keys = {
        {
            "<Leader>fT",
            "<cmd>TodoTelescope<cr>",
            desc = "[f]ind [T]odo comments with telescope."
        }
    }
}
