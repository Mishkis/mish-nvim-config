return {
    set = function(highlight, opts)
        vim.api.nvim_set_hl(0, highlight, opts)
    end,

    get = function(highlight)
        return vim.api.nvim_get_hl(0, { name = highlight })
    end
}
