local col = require("colors")

local highlights = {
	Cursor = {fg = col.normalModeFG, bg = col.normalModeBG},
	CursorLine = {bg = col.lightBackground},
	EndOfBuffer = {fg = col.greyPink, bg = col.background},
	WinSeperator = {fg = col.normalModeBG, bg = col.normalModeFG},
	NonText = {fg = col.greyPink, bg = col.background},
	Normal = {fg = col.text, bg = col.background},
	MsgArea = {fg = col.text, bg = col.black}
}

for group, val in pairs(highlights) do 
	vim.api.nvim_set_hl(0, group, val)
end
