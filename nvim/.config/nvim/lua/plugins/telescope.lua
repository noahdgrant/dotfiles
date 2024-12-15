-- https://github.com/nvim-telescope/telescope.nvim
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },
    config = function()
        require("telescope").setup({
            extentions = { fzf = {} },
        })

        require("telescope").load_extension("fzf")

        local builtin = require("telescope.builtin")

        -- Ctrl + x (go to selection in vertical split)
        -- Ctrl + v (go to selection in horizontal split)
        -- Ctrl + u (scroll up in preview window)
        -- Ctrl + d (scroll down in preview window)
        -- Ctrl + q (puts results into quickfix list)

        vim.keymap.set("n", "<leader>fd", builtin.find_files, { desc = "[f]ind [d]irectory" })
        vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "[f]ind [g]it files" })
        vim.keymap.set("n", "<leader>ft", builtin.grep_string, { desc = "[f]ind [t]his" })
        vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "[f]ind [s]ymbol" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[f]ind [h]elp tags" })
        vim.keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "[f]ind [m]anual pages" })
        vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find, { desc = "[f]ind [b]uffer" })
        vim.keymap.set("n", "<leader>fc", function()
            require("telescope.builtin").find_files({
                cwd = vim.fn.stdpath("config"),
            })
        end, { desc = "[f]ind [c]onfig - searches neovim config" })

        require("telescope.multigrep").setup()
    end,
}
