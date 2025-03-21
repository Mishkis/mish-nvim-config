local col = require("theme.colors")

local highlights = {
    Cursor = { fg = col.normalModeFG, bg = col.normalModeBG },
    CursorLine = { bg = col.lightBackground },
    EndOfBuffer = { fg = col.greyPink },
    WinSeparator = { fg = col.normalModeBG },
    Normal = { fg = col.text, bg = col.background },
    NormalNC = { fg = col.text, bg = col.black },
    Folded = { link = "Normal" },
    MsgArea = { fg = col.text, bg = col.black },
    Visual = { bg = col.lightGreyPink },

    Search = { fg = col.background, bg = col.replaceModeBG },
    CurSearch = { fg = col.background, bg = col.whitePink },

    -- Code
    ["@variable"] = { fg = col.transBlue },
    Constant = { fg = col.insertModeBG },
    Keyword = { fg = col.yellow },
    ["@keyword.operator"] = { fg = col.violet },
    ["@keyword.function"] = { fg = col.orange },
    Statement = { fg = col.transPink },
    Comment = { fg = col.greyPink },
    String = { fg = col.visualModeBG },
    Function = { fg = col.replaceModeBG },
    Operator = { fg = col.text },
    Special = { fg = col.orange },
    Identifier = { fg = col.lightPink },
    Delimiter = { fg = col.purple },

    -- Tab selection, menus
    PMenu = { fg = col.text, bg = col.darkPurple },
    PMenuSel = { bg = col.greyPink },
    PMenuSbar = { bg = col.greyPink },
    PMenuThumb = { bg = col.whitePink },

    -- Floating Windows
    NormalFloat = { fg = col.text, bg = col.darkPurple },
    FloatBorder = { fg = col.text, bg = col.darkPurple },

    Conceal = { bg = col.greyPink },

    -- Errors
    Error = { fg = col.lightRed, bg = col.red },
    ErrorMsg = { fg = col.text, bg = col.red },
    NvimInternalError = { bg = col.red },
    WarningMsg = { fg = col.orange },

    -- Diagnostic Errors
    DiagnosticError = { fg = col.replaceModeBG, bg = col.diagnosticRed },
    DiagnosticWarn = { fg = col.orange, bg = col.diagnosticOrange },
    DiagnosticInfo = { fg = col.visualModeBG, bg = col.diagnosticLightBlue },
    DiagnosticHint = { fg = col.transBlue, bg = col.diagnosticBlue },
    DiagnosticOk = { fg = col.insertModeBG, bg = col.diagnosticGreen },

    -- Line Numbers
    LineNr = { fg = col.pink, bg = col.darkPurple },
    CursorLineNr = { fg = col.whitePink, bg = col.greyPink },

    ErrorLineNr = { fg = col.normalModeFG, bg = col.replaceModeBG },
    CursorErrorLineNr = { fg = col.whitePink, bg = col.replaceModeBG },

    WarningLineNr = { fg = col.normalModeFG, bg = col.orange },
    CursorWarningLineNr = { fg = col.whitePink, bg = col.orange },

    InfoLineNr = { fg = col.normalModeFG, bg = col.visualModeBG },
    CursorInfoLineNr = { fg = col.whitePink, bg = col.visualModeBG },

    HintLineNr = { fg = col.normalModeFG, bg = col.transBlue },
    CursorHintLineNr = { fg = col.whitePink, bg = col.transBlue },

    BreakpointLineNr = { fg = col.replaceModeBG, bg = col.darkPurple },
    CursorBreakpointLineNr = { fg = col.replaceModeBG, bg = col.greyPink },

    LineNrTrans = { fg = col.pink, bg = col.background },
    CursorLineNrTrans = { fg = col.whitePink, bg = col.background },
    LineNrDeselected = { fg = col.pink, bg = col.normalModeBlack },

    -- Status Line
    WinMode = { fg = col.normalModeFG, bg = col.normalModeBG },
    WinModeTrans = { fg = col.normalModeBG, bg = col.normalModeFG },

    StatusError = { fg = col.replaceModeBG, bg = col.normalModeFG },
    StatusWarning = { fg = col.orange, bg = col.normalModeFG },

    Modified = { fg = col.replaceModeFG, bg = col.replaceModeBG },
    ModifiedTrans = { fg = col.replaceModeBG, bg = col.normalModeFG },

    -- Window Bar
    ModifiedWinBarTrans = { fg = col.replaceModeBG, bg = col.insertModeBG },
    WinBarLeft = { fg = col.text, bg = col.insertModeBG },
    WinBarLeftTrans = { fg = col.insertModeBG, bg = col.normalModeFG },
    WinBarRight = { link = "WinMode" },

    -- Tab Line
    TabNeovim = { fg = col.insertModeFG, bg = col.insertModeBG },
    TabNeovimTrans = { fg = col.insertModeBG, bg = col.insertModeFG },
    TabGithubTrans = { fg = col.insertModeFG, bg = col.diagnosticOrange },
    TabGithub = { fg = col.orange, bg = col.diagnosticOrange },
    TabLeftStart = { fg = col.diagnosticOrange, bg = col.normalModeBG },
    TabLeft = { link = "WinMode" },
    TabMain = { link = "WinModeTrans" },
    TabRight = { link = "WinMode" },
    TabFlagTrans = { fg = col.normalModeBG, bg = col.transBlue },
    TabFlagBlue = { fg = col.transPink, bg = col.transBlue },
    TabFlagPink = { fg = col.transPink, bg = col.transWhite },
    TabFlagWhite = { fg = col.transWhite, bg = col.transPink },

    -- Git Signs
    DiffAdd = { bg = col.insertModeFG },
    DiffDelete = { bg = col.replaceModeFG },
    GitSignsAddInline = { fg = col.insertModeBG },
    GitSignsDeleteInline = { fg = col.replaceModeBG },
    GitSignsChangeInline = { fg = col.insertModeBG },
    -- These are for the status line
    GitSignsAdd = { fg = col.insertModeBG, bg = col.insertModeFG },
    GitSignsDelete = { fg = col.replaceModeBG, bg = col.replaceModeFG },
    GitSignsChange = { fg = col.orange, bg = col.diagnosticOrange },
    CursorGitSignsAdd = { fg = col.insertModeFG, bg = col.insertModeBG },
    CursorGitSignsDelete = { fg = col.replaceModeFG, bg = col.replaceModeBG },
    CursorGitSignsChange = { fg = col.diagnosticOrange, bg = col.orange },
    GitSignsStagedAdd = { fg = col.insertModeBG, bg = col.insertModeFG },
    GitSignsStagedDelete = { fg = col.replaceModeBG, bg = col.replaceModeFG },
    GitSignsStagedChange = { fg = col.orange, bg = col.diagnosticOrange },
    CursorGitSignsStagedAdd = { fg = col.insertModeFG, bg = col.insertModeBG },
    CursorGitSignsStagedDelete = { fg = col.replaceModeFG, bg = col.replaceModeBG },
    CursorGitSignsStagedChange = { fg = col.diagnosticOrange, bg = col.orange },


    -- CMP Completion menu
    -- Defined in cmp.lua as it is lazy loaded and would override changes
}

for group, val in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, val)
end
