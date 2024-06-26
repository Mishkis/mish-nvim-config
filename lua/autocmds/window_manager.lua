vim.api.nvim_create_autocmd("WinLeave", {
    callback = function()
        -- vim.opt.stc = "%#LineNr#%=%r│ "
        vim.opt.stc = " "
        vim.opt.nu = false
        vim.opt.rnu = false
        vim.opt.cursorline = false
    end
})

vim.api.nvim_create_autocmd("WinEnter", {
    callback = function()
        vim.opt.stc = "%=%#CursorLineNr#%{v:relnum<=1?v:relnum.'│  ':''}%#LineNr#%=%{v:relnum>1?v:relnum.'│ ':''}"
        vim.opt.nu = true
        vim.opt.rnu = true
        vim.opt.cursorline = true
    end
})
