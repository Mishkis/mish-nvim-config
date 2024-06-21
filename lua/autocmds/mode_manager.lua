local col = require("theme/colors")

local changedHighlights = {
    ["NormalNC"] = { 0, 3 },
    ["Cursor"] = { 1, 2 },
    ["WinSeparator"] = { 2, 2 },
    ["WinMode"] = { 1, 2 },
    ["WinModeTrans"] = { 1, 2 },
    ["WinDir"] = {2, 1},
}

local icons = {
    ["lua"] = "",
    ["python"] = "",
    ["tex"] = "󱗆",
    ["javascript"] = "",
    ["toml"] = "",
    ["json"] = "",
    ["jproperties"] = "",
    ["text"] = "",
    ["c"] = "",
    ["cs"] = "",
}

local function ModeUpdate(textMode, colors)
    for targetHighlight, i in pairs(changedHighlights) do
        vim.api.nvim_set_hl(0, targetHighlight, {fg = colors[i[1]], bg = colors[i[2]]})
    end

    local icon = icons[vim.bo.filetype]
    if icon == nil then
        icon = ""
    end

    vim.opt_local.stl="%#WinMode# "..icon.." %{winnr()} %#WinMode#%-8.("..textMode.."%) %#WinModeTrans#%#WinDir# %F %#Modified#%m%#WinDir#%=%-4.L %#WinModeTrans#%#WinMode#   %-3.l%-3.(:%)%-3.c"
end

vim.api.nvim_create_autocmd("ModeChanged", {
    callback = function()
        local charToMatch = string.lower(string.sub(vim.v.event.new_mode, 1, 1))
        local matchingString = {
            ["n"] = { "NORMAL", { col.normalModeFG, col.normalModeBG, col.normalModeBlack }},
            ["v"] = { "VISUAL", { col.visualModeFG, col.visualModeBG, col.visualModeBlack }},
            ["\22"] = { "VISUAL", { col.visualModeFG, col.visualModeBG, col.visualModeBlack }},
            ["s"] = { "SELECT", { col.visualModeFG, col.visualModeBG, col.visualModeBlack }},
            ["\19"] = { "SELECT", { col.visualModeFG, col.visualModeBG, col.visualModeBlack }},
            ["i"] = { "INSERT", { col.insertModeFG, col.insertModeBG, col.insertModeBlack }},
            ["r"] = { "REPLACE", { col.replaceModeFG, col.replaceModeBG, col.replaceModeBlack }},
            ["c"] = { "COMMAND", { col.commandModeFG, col.commandModeBG, col.commandModeBlack }},
            ["t"] = { "TERMINAL", { col.commandModeFG, col.commandModeBG, col.commandModeBlack }},
        }
        local match = matchingString[charToMatch]

        ModeUpdate(match[1], match[2])
    end
})

ModeUpdate("NORMAL", { col.normalModeFG, col.normalModeBG, col.normalModeBlack })
