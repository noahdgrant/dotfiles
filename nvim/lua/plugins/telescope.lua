-- Telescope (fuzzy finder)
return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- Fuzzy Finder Algorithm which requires local dependencies to be built.
        -- Only load if `make` is available. Make sure you have the system
        -- requirements installed.
      {
            'nvim-telescope/telescope-fzf-native.nvim',
            -- NOTE: If you are having trouble with this installation,
            --       refer to the README for telescope-fzf-native for more instructions.
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
    },
    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>sf', builtin.find_files, {desc = "[s]earch [f]iles"})
        vim.keymap.set('n', '<leader>st', builtin.grep_string, {desc = "[s]earch [t]his"})
        vim.keymap.set('n', '<leader>ss', builtin.live_grep, {desc = "[s]earch [s]ymbol"})
    end,
}
