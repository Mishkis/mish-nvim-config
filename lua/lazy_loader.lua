-- Define leader key
vim.g.mapleader = " "

-- Load lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end

vim.opt.rtp:prepend(lazypath)

-- Setup plugins from plugins folder using lazyvim plugins.lua
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },

    change_detection = {
        enabled = false,
    },
})
