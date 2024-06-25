local keys = require("helpers.keys")

return {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" }
    },

    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                    },
                },
            }
        })
        require("telescope").load_extension("fzf")

        local builtin = require("telescope.builtin")

        -- File navigation
        keys.set("<Leader>ff", builtin.find_files, "[f]ind [f]iles with telescope.")
        keys.set("<Leader>fw", builtin.live_grep, "[f]ind [w]ords with telescope grep.")
        keys.set("<Leader>fb", builtin.buffers, "[f]ind [b]uffers with telescope.")

        -- Command navigation                                                                                  
        keys.set("<Leader>fc", builtin.commands, "[f]ind [c]ommands with telescope.")
        keys.set("<Leader>fp", builtin.command_history, "[f]ind [p]ast commands with telescope.")

        keys.set("<Leader>fd", builtin.diagnostics, "[f]ind [d]iagnostics with telescope.")

        keys.set("<Leader>fh", builtin.highlights, "[f]ind [h]ighlights with telescope.")

        keys.set("<Leader>fr", builtin.registers, "[f]ind [r]egisters with telescope.")
    end,
}
