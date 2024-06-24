return {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" }
    },

    keys = {
        -- File navigation
        {"<Leader>ff", "<cmd>Telescope find_files<cr>", desc = "[f]ind [f]iles with telescope."},
        {"<Leader>fw", "<cmd>Telescope live_grep<cr>", desc = "[f]ind [w]ords with telescope grep."},
        {"<Leader>fb", "<cmd>Telescope buffers<cr>", desc = "[f]ind [b]uffers with telescope."},

        -- Command navigation
        {"<Leader>fc", "<cmd>Telescope commands<cr>", desc = "[f]ind [c]ommands with telescope."},
        {"<Leader>fp", "<cmd>Telescope command_history<cr>", desc = "[f]ind [p]ast commands with telescope."},

        {"<Leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "[f]ind [d]iagnostics with telescope."},

        {"<Leader>fh", "<cmd>Telescope highlights<cr>", desc = "[f]ind [h]ighlights with telescope."},

        {"<Leader>fr", "<cmd>Telescope registers<cr>", desc = "[f]ind [r]egisters with telescope."},
    },

    cmd = "Telescope",

    config = function()
        require("telescope").setup()
        require("telescope").load_extension("fzf")
    end,
}
