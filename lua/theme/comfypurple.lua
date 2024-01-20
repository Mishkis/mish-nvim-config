local col = require("theme/colors")

local highlights = {
	Cursor = {fg = col.normalModeFG, bg = col.normalModeBG},
	CursorLine = {bg = col.lightBackground},
	EndOfBuffer = {fg = col.greyPink},
	WinSeparator = {fg = col.normalModeBG, bg = col.normalModeFG},
	Normal = {fg = col.text, bg = col.background},
	NormalNC = {fg = col.text, bg = col.black},
     MsgArea = {fg = col.text, bg = col.black},
	Visual = {bg = col.lightGreyPink},
	
	--Line Numbers
	LineNr = {fg = col.pink, bg = col.darkPurple},
	CursorLineNr = {fg = col.whitePink, bg = col.greyPink},

     --Status Line
     WinMode = {fg = col.normalModeFG, bg = col.normalModeBG},
     WinModeTrans = {fg = col.normalModeBG, bg = col.greyPink},
     WinDir = {fg = col.pink, bg = col.greyPink},
     Modified = {fg = col.lightRed, bg = col.red},
}

for group, val in pairs(highlights) do 
	vim.api.nvim_set_hl(0, group, val)
end
