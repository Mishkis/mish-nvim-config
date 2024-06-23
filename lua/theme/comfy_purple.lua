local col = require("theme/colors")

local highlights = {
    Cursor = {fg = col.normalModeFG, bg = col.normalModeBG},
    CursorLine = {bg = col.lightBackground},
    EndOfBuffer = {fg = col.greyPink},
    WinSeparator = {fg = col.normalModeBG},
    Normal = {fg = col.text, bg = col.background},
    NormalNC = {fg = col.text, bg = col.black},
    MsgArea = {fg = col.text, bg = col.black},
    Visual = {bg = col.lightGreyPink},

    Search = {fg = col.background, bg = col.lightRed},

    --Tab selection, menus
    PMenu = {fg = col.text, bg = col.darkPurple},
    PMenuSel = {bg = col.greyPink},
    PMenuSbar = {bg = col.greyPink},
    PMenuThumb = {bg = col.whitePink},

    Conceal = {bg = col.greyPink},
    Folded = {fg = col.pink, bg = col.darkPurple},

    --Errors
    Error = {fg = col.lightRed, bg = col.red},
    ErrorMsg = {fg = col.text, bg = col.red},
    NvimInternalError = {bg = col.red},
    WarningMsg = {fg = col.red},

    --Line Numbers
    LineNr = {fg = col.pink, bg = col.darkPurple},
    CursorLineNr = {fg = col.whitePink, bg = col.greyPink},

    --Status Line
    WinMode = {fg = col.normalModeFG, bg = col.normalModeBG},
    WinModeTrans = {fg = col.normalModeBG, bg = col.normalModeFG},
    Modified = {fg = col.lightRed, bg = col.red},
    ModifiedTrans = {fg = col.red, bg = col.normalModeFG},

    --Tab Line
    TabNeovim = {fg = col.insertModeFG, bg = col.insertModeBG},
    TabNeovimTrans = {fg = col.insertModeBG, bg = col.normalModeFG},
    TabLeft = {link = "WinMode"},
    TabMain = {link = "WinModeTrans"},
    TabRight = {link = "WinMode"},
}

for group, val in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, val)
end
