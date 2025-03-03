return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        -- Required
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" },

        -- Extensions
        {
            "ahmedkhalf/project.nvim",
            main = "project_nvim",
            opts = {
                detection_methods = { "pattern", "lsp" },
            },
            config = true
        },
        "2kabhishek/nerdy.nvim",
    },

    keys = {

        -- File navigation
        { "<Leader>ff", require("telescope.builtin").find_files,           desc = "[f]ind [f]iles with telescope." },
        { "<Leader>fw", require("telescope.builtin").live_grep,            desc = "[f]ind [w]ords with telescope grep." },
        { "<Leader>fb", require("telescope.builtin").buffers,              desc = "[f]ind [b]uffers with telescope." },

        -- Command navigation
        { "<Leader>fc", require("telescope.builtin").commands,             desc = "[f]ind [c]ommands with telescope." },
        { "<Leader>fC", require("telescope.builtin").command_history,      desc = "[f]ind past [C]ommands with telescope." },

        -- Using LSP.
        { "<Leader>fd", require("telescope.builtin").lsp_definitions,      desc = "[f]ind [d]efinitions with telescope." },
        { "<Leader>ft", require("telescope.builtin").lsp_type_definitions, desc = "[f]ind [t]ype definitions with telescope." },
        { "<Leader>fD", require("telescope.builtin").diagnostics,          desc = "[f]ind [D]iagnostics with telescope." },
        { "<Leader>fr", require("telescope.builtin").lsp_references,       desc = "[f]ind [r]eferences with telescope." },

        -- Misc.
        { "<Leader>fh", require("telescope.builtin").highlights,           desc = "[f]ind [h]ighlights with telescope." },
        { "<Leader>fR", require("telescope.builtin").registers,            desc = "[f]ind [R]egisters with telescope." },
        { "<Leader>fv", require("telescope.builtin").treesitter,           desc = "[f]ind [v]ariables with telescope." },

        -- Extensions
        { "<Leader>fp", "<cmd>Telescope projects<cr>",                     desc = "[f]ind [p]rojects with project." },
        { "<Leader>fe", "<cmd>Telescope nerdy<cr>",                        desc = "[f]ind [e]moji with nerdy." },
    },

    cmd = "Telescope",

    config = function()
        local actions = require("telescope.actions")
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                preview = {
                    filesize_limit = 1,
                    timeout = false,
                    treesitter = true,
                },
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                    },
                },
                path_display = function(opts, path)
                    return path:gsub("\\", "/")
                end
            },
        })

        telescope.load_extension("fzf")
        telescope.load_extension("projects")
        telescope.load_extension("nerdy")
    end,
}
