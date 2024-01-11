vim.opt.acd = true
vim.opt.cdhome = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Line Breaking Options
vim.opt.lbr = true
vim.opt.breakindent = true
vim.opt.briopt = 'shift:5,sbr'
vim.opt.sbr = '--->'

vim.opt.display = lastline

vim.opt.cmdheight = 3

vim.opt.fillchars = 'stl:·,eob:#'

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.cursorline = true

vim.cmd[[hi StatusColumn guifg=#c98cd0 guibg=#453548]]
vim.opt.stc = '%#StatusColumn# %=%r│ '

vim.opt.cb = 'unnamedplus'
