return {
    {
        "altermo/ultimate-autopair.nvim",
        config = function()
            require("ultimate-autopair").setup({
                fastwarp = {
                    faster = true,
                    map = "<C-w>",
                    rmap = "<C-g>",
                }
            })
        end
    },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    }
}
