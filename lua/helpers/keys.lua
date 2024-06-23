return {
    --Options is assumed to be description by default, and mode if not provided is assumed to be normal.
    set = function(keys, command, options, mode)
        if type(options) == "string" then
            options = { desc = options }
        end

        vim.keymap.set(mode or "n", keys, command, options)
    end,

    del = vim.keymap.del,
}
