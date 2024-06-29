local col = require("theme.colors")
local hl = require("helpers.highlights")
local mode = require("helpers.mode")

local changedHighlights = {
    ["NormalNC"] = { 0, 3 },
    ["Cursor"] = { 1, 2 },
    ["WinSeparator"] = { 2, 3 },
    ["WinMode"] = { 1, 2 },
    ["WinModeTrans"] = { 2, 1 },
    ["StatusError"] = { col.replaceModeBG, 1 },
    ["StatusWarning"] = { col.orange, 1 },
    ["ModifiedTrans"] = { col.replaceModeBG, 1 },
    ["TabLeftStart"] = { col.insertModeFG, 2 },
    ["TabFlagTrans"] = { 2, col.transBlue },
    ["WinBarLeftTrans"] = { hl.get("WinBarLeftTrans").fg, 1 },
    ["WinBarCenter"] = { hl.get("WinBarCenter").fg, 1 },
    ["LineNrDeselected"] = { col.pink, 3 },
}

local function ModeUpdate(colors)
    for targetHighlight, i in pairs(changedHighlights) do
        local foreground = i[1]
        if type(foreground) == "number" then
            foreground = colors[foreground]
        end

        local background = i[2]
        if type(background) == "number" then
            background = colors[background]
        end

        hl.set(targetHighlight, { fg = foreground, bg = background })
    end
end

vim.api.nvim_create_autocmd("ModeChanged", {
    callback = function()
        local colors = mode.isInsert() and { col.insertModeFG, col.insertModeBG, col.insertModeBlack }
            or mode.isVisual() and { col.visualModeFG, col.visualModeBG, col.visualModeBlack }
            or mode.isCommand() and { col.commandModeFG, col.commandModeBG, col.commandModeBlack }
            or mode.isReplace() and { col.replaceModeFG, col.replaceModeBG, col.replaceModeBlack }
            or { col.normalModeFG, col.normalModeBG, col.normalModeBlack }

        ModeUpdate(colors)
    end
})

ModeUpdate({ col.normalModeFG, col.normalModeBG, col.normalModeBlack })
