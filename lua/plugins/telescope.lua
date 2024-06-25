local keys = require("helpers.keys")

return {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = {
        -- Required
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" },

        -- Extensions
        { "ahmedkhalf/project.nvim", main = "project_nvim", config = true },
        "2kabhishek/nerdy.nvim",
    },

    config = function()
        local actions = require("telescope.actions")
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                    },
                },
            },
        })

        telescope.load_extension("fzf")
        telescope.load_extension("projects")
        telescope.load_extension("nerdy")

        local builtin = require("telescope.builtin")

        -- File navigation
        keys.set("<Leader>ff", builtin.find_files, "[f]ind [f]iles with telescope.")
        keys.set("<Leader>fw", builtin.live_grep, "[f]ind [w]ords with telescope grep.")
        keys.set("<Leader>fb", builtin.buffers, "[f]ind [b]uffers with telescope.")

        -- Command navigation                                                                                  
        keys.set("<Leader>fc", builtin.commands, "[f]ind [c]ommands with telescope.")
        keys.set("<Leader>fC", builtin.command_history, "[f]ind past [C]ommands with telescope.")

        keys.set("<Leader>fd", builtin.diagnostics, "[f]ind [d]iagnostics with telescope.")

        keys.set("<Leader>fh", builtin.highlights, "[f]ind [h]ighlights with telescope.")

        keys.set("<Leader>fr", builtin.registers, "[f]ind [r]egisters with telescope.")

        -- Extensions
        keys.set("<Leader>fp", "<cmd>Telescope projects<cr>", "[f]ind [p]rojects with projects")
        keys.set("<Leader>fe", "<cmd>Telescope nerdy<cr>", "[f]ind [e]moji with nerdy")
    end,
}
