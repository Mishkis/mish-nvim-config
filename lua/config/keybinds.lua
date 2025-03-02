local keys = require("helpers.keys")
local registers = require("helpers.registers")

-- Stop x from storing in the + and * registry because it's annoying
keys.set("x", '"xx')

keys.set("<Leader><Leader>", function()
    registers.swap("+", "p")
    -- Reload tab bar to actually show the updated registers.
    vim.opt.tal = "%{%v:lua.Tabbar()%}"
end, "Swaps the + and p registers for pasting.")

keys.set("<Leader>ch", "<cmd>noh<sr>", "[c]lear [h]ighlights.")
