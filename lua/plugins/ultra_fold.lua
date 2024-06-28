local keys = require("helpers.keys")

return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async"
    },
    config = function()
        local ufo = require("ufo")
        keys.set("zR", ufo.openAllFolds)
        keys.set("zM", ufo.closeAllFolds)

        require('ufo').setup({
            provider_selector = function(bufnr, filetype, buftype)
                return {'treesitter', 'indent'}
            end,
            open_fold_hl_timeout = 0,
        })
    end
}
