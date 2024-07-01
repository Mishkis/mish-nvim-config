return {
    "nvim-pack/nvim-spectre",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    keys = {
        { "<Leader>S", "<cmd>Spectre<cr>", desc = "[S]ubstitue with Spectre." }
    },
    cmd = "Spectre"
}
