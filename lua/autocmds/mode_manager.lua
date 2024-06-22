local col = require("theme/colors")

local changedHighlights = {
    ["NormalNC"] = { 0, 3 },
    ["Cursor"] = { 1, 2 },
    ["WinSeparator"] = { 1, 3 },
    ["WinMode"] = { 1, 2 },
    ["WinModeTrans"] = { 2, 1 },
    ["ModifiedTrans"] = { col.red, 1 },
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

        vim.api.nvim_set_hl(0, targetHighlight, {fg = foreground, bg = background})
    end
end

vim.api.nvim_create_autocmd("ModeChanged", {
    callback = function()
        local charToMatch = string.lower(string.sub(vim.v.event.new_mode, 1, 1))
        local matchingString = {
            ["n"] =  { col.normalModeFG, col.normalModeBG, col.normalModeBlack },
            ["v"] = { col.visualModeFG, col.visualModeBG, col.visualModeBlack },
            ["\22"] = { col.visualModeFG, col.visualModeBG, col.visualModeBlack },
            ["s"] = { col.visualModeFG, col.visualModeBG, col.visualModeBlack },
            ["\19"] = { col.visualModeFG, col.visualModeBG, col.visualModeBlack },
            ["i"] = { col.insertModeFG, col.insertModeBG, col.insertModeBlack },
            ["r"] = { col.replaceModeFG, col.replaceModeBG, col.replaceModeBlack },
            ["c"] = { col.commandModeFG, col.commandModeBG, col.commandModeBlack },
            ["t"] = { col.commandModeFG, col.commandModeBG, col.commandModeBlack },
        }

        ModeUpdate(matchingString[charToMatch])
    end
})

ModeUpdate({ col.normalModeFG, col.normalModeBG, col.normalModeBlack })
