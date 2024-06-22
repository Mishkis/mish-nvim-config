vim.g.mapleader = " "

vim.opt.acd = true
vim.opt.cdhome = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Line Breaking Options
vim.opt.wrap = false
vim.opt.lbr = true
vim.opt.breakindent = true
vim.opt.briopt = "shift:5,sbr"
vim.opt.sbr = "--->"

vim.opt.display = "lastline"

vim.opt.cmdheight = 2

vim.opt.fillchars = "eob:#"

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.cursorline = true

vim.opt.showmode = false

vim.opt.stl = "%#WinMode#  %{winnr()} %#WinMode#%-8{'NORMAL'} %#WinModeTrans#%#WinDir# %F %#Modified#%m%#WinDir#%=%-4.L %#WinModeTrans#%#WinMode#   %-3.l%-3.(:%)%-3.c"
vim.opt.stc = "%=%#CursorLineNr#%{v:relnum<=1?v:relnum.'│  ':''}%#LineNr#%=%{v:relnum>1?v:relnum.'│ ':''}"

vim.opt.splitright = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.scrolloff = 1

vim.opt.tildeop = true

vim.opt.virtualedit = "block"

vim.opt.cb = "unnamedplus"

vim.opt.inccommand = "split"

vim.opt.termguicolors = true
vim.opt.guifont = "SauceCodePro NF"

vim.opt.shellslash = true
