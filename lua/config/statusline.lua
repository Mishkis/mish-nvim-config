local modes = {
    ["n"] = "NORMAL",
    ["no"] = "NORMAL",
    ["v"] = "VISUAL",
    ["V"] = "VISUAL",
    [""] = "VISUAL",
    ["s"] = "SELECT",
    ["S"] = "SELECT",
    [""] = "SELECT",
    ["i"] = "INSERT",
    ["ic"] = "INSERT",
    ["R"] = "REPLACE",
    ["Rv"] = "VISUAL",
    ["c"] = "COMMAND",
    ["cv"] = "VIM EX",
    ["ce"] = "EX",
    ["r"] = "PROMPT",
    ["rm"] = "MOAR",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    ["t"] = "TERMINAL",
}

local function mode()
    return modes[vim.api.nvim_get_mode().mode]
end

local function icon()
    return (require("nvim-web-devicons").get_icon_color_by_filetype(vim.bo.filetype))
end

function Statusline()
    return "%#WinMode# "..icon().."%#WinMode# %{winnr()} %#WinMode#%-7.{'"..mode().."'} %#WinModeTrans# %F %#Modified#%m%#WinModeTrans#%=%-4.L %#WinModeTrans#%#WinMode#   %-3.l%-3.(:%)%-3.c"
end

vim.opt.stl = "%{%v:lua.Statusline()%}"
