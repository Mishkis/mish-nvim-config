return {
    {
        "altermo/ultimate-autopair.nvim",
        event = "ModeChanged",
        opts = {
            fastwarp = {
                fastwarp = true,
                map = "<C-w>",
                rmap = "<C-g>"
            }
        },
    },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        opts = {}
    }
}
