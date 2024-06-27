vim.api.nvim_create_autocmd("WinLeave", {
    callback = function()
        vim.opt.stc = "%#LineNrDeselected#┆"
        vim.opt.nu = false
        vim.opt.rnu = false
        vim.opt.cursorline = false
    end
})

vim.api.nvim_create_autocmd("WinEnter", {
    callback = function()
        vim.opt.stc = "%{%v:lua.Statuscolumn(v:lnum, v:relnum, v:virtnum)%}"
        vim.opt.nu = true
        vim.opt.rnu = true
        vim.opt.cursorline = true
    end
})
