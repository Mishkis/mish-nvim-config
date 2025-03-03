local keys = require("helpers.keys")
local registers = require("helpers.registers")

-- Stop x from storing in the + and * registry because it's annoying
keys.set("x", '"xx')

keys.set("<Leader><Leader>", function()
    registers.swap("+", "p")
    -- Reload tab bar to actually show the updated registers.
    vim.opt.tal = "%{%v:lua.Tabbar()%}"
end, "Swaps the + and p registers for pasting.")

keys.set("<Leader>c", "<cmd>noh<sr>", "[c]lear highlights.")

keys.set("<Leader>rr", function()
    vim.cmd("botright split")
    vim.api.nvim_win_set_buf(vim.api.nvim_get_current_win(), vim.api.nvim_create_buf(false, false))
    vim.cmd("terminal cargo run")
end, "ca[r]go [r]un")

keys.set("<Leader>gt", function()
    vim.g.gitsigns_enabled = not vim.g.gitsigns_enabled

    -- Update status column
    vim.opt.stc = "%{%v:lua.Statuscolumn(v:lnum, v:relnum, v:virtnum)%}"
end, "[g]it [t]oggle signs")
