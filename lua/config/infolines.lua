local mode = require("helpers/mode")
local registers = require("helpers/registers")

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

local function get_version()
    local version = vim.version()
    return "NVIM v"..version.major.."."..version.minor.."."..version.patch
end

local function get_current_lsp_server()
    local server = vim.lsp.get_active_clients({ bufnr = vim.api.nvim_get_current_buf() })
    if server == {} or server[1] == nil then
        return "N/A 󰒑 "
    else
        return server[1].name.."  "
    end
end

local function shorten_string(str)
    local output = string.sub(str, 1, 20)
    output = (string.gsub(output, '"', '\"'))
    output = (string.gsub(output, "'", "\'"))
    output = (string.gsub(output, "%%", "%%%%"))
    if string.len(str) > 20 then
        output = output.."..."
    end

    return output
end

local function get_lsp_information()
    local errors = vim.diagnostic.get(0, { severity =  1 })
    local error_count = vim.tbl_count(errors)

    local warning_count = vim.tbl_count(vim.diagnostic.get(0, { severity =  2 }))

    local output = ""
    if error_count ~= 0 then
        output = output.."%#StatusError#"..errors[1].lnum.." "..shorten_string(errors[1].message).."  "..error_count.." "
    end
    if warning_count ~= 0 then
        output = output.."%#StatusWarning# "..warning_count.." "
    end

    return output
end

function Statusline()
    return "%#WinMode# "..get_mode_icon().."%#WinMode# %#WinMode#%-7.{'"..get_mode().."'} %#WinModeTrans# 󱧷 %F %#ModifiedTrans#%{%&modified ? '%#Modified#󱙄 %#ModifiedTrans#' : ''%}%#WinModeTrans#%="..get_lsp_information().."%#WinModeTrans#󰉸 %-4.L %#WinModeTrans#%#WinMode#   %-3.l%-3.(:%)%-3.c"
end

function Windowbar()
    return "%{%&modified ? '%#Modified# 󱙄 %#ModifiedTrans#' : ''%}%#WinModeTrans#  %t%=%#WinMode#  %{winnr()} "..get_icon().."  "
end

function Tabbar()
    return "%#TabNeovim#  "..get_version().." %#TabNeovimTrans#   Windows: %{len(nvim_list_wins())} %#TabLeftStart#%#TabLeft# 󰆒  \""..shorten_string(registers.get("p")).."\" %#TabMain#%=%#TabRight#    \""..shorten_string(registers.get("+")).."\" %#TabFlagTrans#%#TabFlagBlue#%#TabFlagPink#%#TabFlagWhite#%#TabFlagBlue#%#TabFlagTrans#%#TabRight# "..get_current_lsp_server().." "
end

vim.opt.ls = 3
vim.opt.stl = "%{%v:lua.Statusline()%}"

vim.opt.wbr = "%{%v:lua.Windowbar()%}"

vim.opt.stal = 2
vim.opt.tal = "%{%v:lua.Tabbar()%}"
