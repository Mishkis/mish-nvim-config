return {
    get = vim.fn.getreg,
    set = vim.fn.setreg,
    swap = function(rega, regb)
        local rega_value = vim.fn.getreg(rega)
        local regb_value = vim.fn.getreg(regb)

        vim.fn.setreg(rega, regb_value)
        vim.fn.setreg(regb, rega_value)
    end
}
