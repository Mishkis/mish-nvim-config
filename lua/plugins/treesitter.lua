local languages = { "c", "lua", "vim", "vimdoc", "query", "python", "c_sharp", "javascript"} 

return {
     "nvim-treesitter/nvim-treesitter",
     config = function()
          require("nvim-treesitter.configs").setup({
               ensure_installed = languages,

               auto_install = true,

               highlight = {
                    enable = true,
               }
          })
     end,
}
