vim.opt.cdhome = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Line Breaking Options
vim.opt.wrap = false
vim.opt.lbr = true
vim.opt.breakindent = true
vim.opt.briopt = "shift:5,sbr"
vim.opt.sbr = "--->"

-- Fold Options, using ufo.
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.opt.display = "lastline"

vim.opt.cmdheight = 2

vim.opt.fillchars = "eob:#"

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.cursorline = true

vim.opt.showmode = false

vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"
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

vim.opt.shellslash = true
