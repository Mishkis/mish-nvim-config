-- Clears ShaDa files on exit, they keep filling up as empty files and prevent nvim from fully closing. I have no clue why.
vim.api.nvim_create_autocmd("ExitPre", {
    callback = function()
        local shadaDir = vim.fn.stdpath("data") .. "/shada"
        for key, file in pairs(vim.fn.globpath(shadaDir, "main.shada.tmp.*", false, 1)) do
            if vim.fn.getfsize(file) == 0 then
                vim.fn.delete(file);
            end
        end
    end
})
