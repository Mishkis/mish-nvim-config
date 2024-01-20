local col = require("theme/colors")

local changedHighlights = {
     "Cursor",
     "WinSeparator",
     "WinMode",
     "WinModeTrans",
}

local function ModeUpdate(textMode, fg, bg)
     for i, targetHighlight in pairs(changedHighlights) do
          vim.api.nvim_set_hl(0, targetHighlight, {fg = fg, bg = bg})
     end
     vim.opt.stl="%#WinMode# %{winnr()} %-8.("..textMode.."%) %#WinModeTrans#│%#WinDir# %F %#Modified#%m%#WinDir#%=%-4.L %#WinModeTrans#│%#WinMode#   %-3.l%-3.(:%)%-3.c" 
end

vim.api.nvim_create_autocmd("ModeChanged", {
     callback = function()
          local charToMatch = string.lower(string.sub(vim.v.event.new_mode, 1, 1))
          local matchingString = {
               ["n"] = { "NORMAL", col.normalModeFG, col.normalModeBG },
               ["v"] = { "VISUAL", col.visualModeFG, col.visualModeBG },
			["\22"] = { "VISUAL", col.visualModeFG, col.visualModeBG },
			["s"] = { "SELECT", col.visualModeFG, col.visualModeBG },
			["\19"] = { "SELECT", col.visualModeFG, col.visualModeBG },
			["i"] = { "INSERT", col.insertModeFG, col.insertModeBG },
			["r"] = { "REPLACE", col.replaceModeFG, col.replaceModeBG },
			["c"] = { "COMMAND", col.commandModeFG, col.commandModeBG },
			["t"] = { "TERMINAL", col.commandModeFG, col.commandModeBG },
		}
          local match = matchingString[charToMatch]

          ModeUpdate(match[1], match[2], match[3])
	end
})

ModeUpdate("NORMAL", col.normalModeFG, col.normalModeBG)
