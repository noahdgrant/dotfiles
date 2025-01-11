return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    opts = {
        menu = {
            width = 120,
        },
    },
    config = function()
        -- Need a function to do this until bug fix is merged in
        local function git_branch()
            local pipe = io.popen("git branch --show-current")
            if pipe then
                local c = pipe:read("*l"):match("^%s*(.-)%s*$")
                pipe:close()
                return c
            end
            return "default list"
        end

        local harpoon = require("harpoon")
        harpoon:setup({ settings = { save_on_toggle = true } })

        vim.keymap.set("n", "<leader>h", function()
            harpoon:list(git_branch()):add()
        end, { desc = "[h]arpoon file" })

        vim.keymap.set("n", "<M-h>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list(git_branch()))
        end, { desc = "show harpooned files" })

        vim.keymap.set("n", "<C-u>", function()
            harpoon:list(git_branch()):select(1)
        end, { desc = "harpoon 1" })

        vim.keymap.set("n", "<C-U>", function()
            vim.cmd.vsp()
            harpoon:list(git_branch()):select(1)
        end, { desc = "harpoon 1 in new split" })

        vim.keymap.set("n", "<C-i>", function()
            harpoon:list(git_branch()):select(2)
        end, { desc = "harpoon 2" })

        vim.keymap.set("n", "<C-I>", function()
            vim.cmd.vsp()
            harpoon:list(git_branch()):select(2)
        end, { desc = "harpoon 2 in new split" })

        vim.keymap.set("n", "<C-o>", function()
            harpoon:list(git_branch()):select(3)
        end, { desc = "harpoon 3" })

        vim.keymap.set("n", "<C-O>", function()
            vim.cmd.vsp()
            harpoon:list(git_branch()):select(3)
        end, { desc = "harpoon 3 in new split" })

        vim.keymap.set("n", "<C-p>", function()
            harpoon:list(git_branch()):select(4)
        end, { desc = "harpoon 4" })

        vim.keymap.set("n", "<C-p>", function()
            vim.cmd.vsp()
            harpoon:list(git_branch()):select(4)
        end, { desc = "harpoon 4 in new split" })
    end,
}
