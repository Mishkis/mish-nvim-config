local mode = require("helpers/mode")

local function get_mode()
    local text_mode = mode.isInsert() and "INSERT"
        or mode.isVisual() and "VISUAL"
        or mode.isCommand() and "COMMAND"
        or mode.isReplace() and "REPLACE"
        or "NORMAL"
    return text_mode
end

local function get_mode_icon()
    local icon = mode.isInsert() and ""
        or mode.isVisual() and "󰒇"
        or mode.isCommand() and ""
        or mode.isReplace() and ""
        or ""
    return icon
end

local function get_icon()
    return (require("nvim-web-devicons").get_icon_color_by_filetype(vim.bo.filetype))
end

function Statusline()
    return "%#WinMode# "..get_mode_icon().."%#WinMode# %#WinMode#%-7.{'"..get_mode().."'} %#WinModeTrans# 󱧷 %F %#ModifiedTrans#%{%&modified ? '%#Modified#󱙄 %#ModifiedTrans#' : ''%}%#WinModeTrans#%=󰉸 %-4.L %#WinModeTrans#%#WinMode#   %-3.l%-3.(:%)%-3.c"
end

function Windowbar()
    return "%{%&modified ? '%#Modified# 󱙄 %#ModifiedTrans#' : ''%}%#WinModeTrans#  %t%=%#WinMode#  %{winnr()} "..get_icon().."  "
end

vim.opt.ls = 3
vim.opt.stl = "%{%v:lua.Statusline()%}"

vim.opt.wbr = "%{%v:lua.Windowbar()%}"
