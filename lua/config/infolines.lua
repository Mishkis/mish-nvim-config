local col = require("theme.colors")
local hl = require("helpers.highlights")
local mode = require("helpers.mode")
local registers = require("helpers.registers")

vim.g.gitsigns_enabled = true;

local function hi(highlight)
    return "%#" .. highlight .. "#"
end

local function get_mode()
    local text_mode = mode.isInsert() and "  INSERT"
        or mode.isVisual() and "󰒇  VISUAL"
        or mode.isCommand() and "  COMMAND"
        or mode.isReplace() and "  REPLACE"
        or "  NORMAL"
    return text_mode
end

local function get_icon()
    local icon, color = require("nvim-web-devicons").get_icon_color_by_filetype(vim.bo.filetype)

    hl.set("ModifiedWinBarTrans", { fg = col.replaceModeBG, bg = color })
    hl.set("WinBarLeft", { fg = col.normalModeBlack, bg = color })
    hl.set("WinBarLeftTrans", { fg = color, bg = hl.get("WinBarLeftTrans").bg })

    return icon
end

local function get_version()
    local version = vim.version()
    return "NVIM v" .. version.major .. "." .. version.minor .. "." .. version.patch
end

local function get_github_info()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns ~= nil then
        return "  " .. vim.b.gitsigns_status_dict.head .. " " .. vim.b.gitsigns_status .. " "
    end
    return "  none "
end

local function get_current_lsp_server()
    local server = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
    if server == {} or server[1] == nil then
        return "N/A 󰒑 "
    else
        return server[1].name .. "  "
    end
end

local function shorten_string(str)
    local output = string.sub(str, 1, 20)
    output = (string.gsub(output, '"', '\"'))
    output = (string.gsub(output, "'", "\'"))
    output = (string.gsub(output, "%%", "%%%%"))
    if string.len(str) > 20 then
        output = output .. "..."
    end

    return output
end

local function get_lsp_information()
    local errors = vim.diagnostic.get(0, { severity = 1 })
    local error_count = vim.tbl_count(errors)

    local warning_count = vim.tbl_count(vim.diagnostic.get(0, { severity = 2 }))

    local output = ""
    if error_count ~= 0 then
        output = output ..
            hi("StatusError") .. "" .. errors[1].lnum .. " " .. shorten_string(errors[1].message) .. "  " ..
            error_count .. " "
    end
    if warning_count ~= 0 then
        output = output .. hi("StatusWarning") .. " " .. warning_count .. " "
    end

    return output
end

-- The following are only used by the status column.

local function get_gitsign(line_num, rel_line_num)
    if (vim.g.gitsigns_enabled == false) then
        return ""
    end
    line_num = line_num - 1
    local sign = vim.api.nvim_buf_get_extmarks(0, -1, { line_num, 0 }, { line_num, -1 },
        { details = true, type = 'sign' })
    if not vim.tbl_isempty(sign) then
        local sign_hl = sign[1][4].sign_hl_group
        if sign_hl ~= nil then
            return hi((rel_line_num < 2 and "Cursor" or "") .. sign_hl)
        end
    end
    return ""
end

local function get_breakpoint_symbol(line_num, rel_line_num)
    local is_breakpoint = not vim.tbl_isempty(vim.fn.sign_getplaced(
        vim.api.nvim_get_current_buf(),
        { group = "dap_breakpoints", lnum = line_num }
    )[1].signs)

    local highlight = (rel_line_num < 2) and hi("CursorBreakpointLineNr") or hi("BreakpointLineNr")

    return is_breakpoint and highlight .. "" or " "
end

local function get_stc_highlight(line_num, rel_line_num)
    local highlight = ""

    if vim.tbl_isempty(vim.diagnostic.get(0, { lnum = line_num - 1 })) then
        highlight = "LineNr"
    elseif not vim.tbl_isempty(vim.diagnostic.get(0, { lnum = line_num - 1, severity = 1 })) then
        highlight = "ErrorLineNr"
    elseif not vim.tbl_isempty(vim.diagnostic.get(0, { lnum = line_num - 1, severity = 2 })) then
        highlight = "WarningLineNr"
    elseif not vim.tbl_isempty(vim.diagnostic.get(0, { lnum = line_num - 1, severity = 3 })) then
        highlight = "InfoLineNr"
    elseif not vim.tbl_isempty(vim.diagnostic.get(0, { lnum = line_num - 1, severity = 4 })) then
        highlight = "HintLineNr"
    end

    if rel_line_num < 2 then
        highlight = "Cursor" .. highlight
    end

    return hi(highlight)
end

local function get_fold_symbol(line_num)
    return vim.fn.foldlevel(line_num) > vim.fn.foldlevel(line_num - 1)
        and (vim.fn.foldclosed(line_num) == -1 and "" or "") or " "
end

-- These are called from the respctive settings.
function Statusline()
    return hi("WinMode") ..
        " %-10.{'" ..
        get_mode() ..
        "'} " ..
        hi("WinModeTrans") ..
        " 󱧷 %F " ..
        hi("ModifiedTrans") ..
        "%{%&modified ? '" ..
        hi("Modified") ..
        "󱙄 " ..
        hi("ModifiedTrans") ..
        "' : ''%}" ..
        hi("WinModeTrans") ..
        "%=" ..
        get_lsp_information() ..
        "" .. hi("WinModeTrans") .. "󰉸 %-4.L " .. hi("WinModeTrans#%#WinMode") .. "   %-3.l%-3.(:%)%-3.c"
end

function Windowbar()
    return "%{%&modified ? '" ..
        hi("Modified") ..
        " 󱙄 " ..
        hi("ModifiedWinBarTrans") ..
        "' : ''%}" ..
        hi("WinBarLeft") ..
        "  %t " .. hi("WinBarLeftTrans#%=%#WinBarRight") .. "  %{winnr()} " .. get_icon() .. "  "
end

function Tabbar()
    return hi("TabNeovim") ..
        "  " ..
        get_version() ..
        " " ..
        hi("TabNeovimTrans") ..
        "   " .. os.date("%Y %B %d, %H:%M ") ..
        hi("TabGithubTrans#%#TabGithub") ..
        get_github_info() ..
        hi("TabLeftStart#%#TabLeft") ..
        " 󰆒  \"" ..
        shorten_string(registers.get("p")) ..
        "\" " ..
        hi("TabMain#%=%#TabRight") ..
        "    \"" ..
        shorten_string(registers.get("+")) ..
        "\" " ..
        hi("TabFlagTrans#%#TabFlagBlue#%#TabFlagPink#%#TabFlagWhite#%#TabFlagBlue#%#TabFlagTrans#%#TabRight") ..
        " " .. get_current_lsp_server() .. " "
end

function Statuscolumn(ln, rn, vn)
    if vn ~= 0 then
        return "%5.{' '}" .. (rn < 2 and "" .. hi("CursorLineNrTrans") .. "" or "" .. hi("LineNrTrans") .. "") .. "┆"
    end

    return get_stc_highlight(ln, rn) ..
        get_gitsign(ln, rn) ..
        get_breakpoint_symbol(ln, rn) ..
        get_fold_symbol(ln) ..
        " %2.{'" ..
        rn .. "'}" .. (rn < 2 and "" .. hi("CursorLineNrTrans") .. "" or "" .. hi("LineNrTrans") .. "") .. "│"
end

vim.opt.ls = 3
vim.opt.stl = "%{%v:lua.Statusline()%}"

vim.opt.wbr = "%{%v:lua.Windowbar()%}"

vim.opt.stal = 2
vim.opt.tal = "%{%v:lua.Tabbar()%}"

vim.opt.stc = "%{%v:lua.Statuscolumn(v:lnum, v:relnum, v:virtnum)%}"
