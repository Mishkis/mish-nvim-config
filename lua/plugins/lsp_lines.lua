local keys = require("helpers.keys")
return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
        require("lsp_lines").setup()

        keys.set("<Leader>l", require("lsp_lines").toggle, "toggle [l]sp lines")
    end
}
