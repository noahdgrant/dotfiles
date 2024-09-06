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
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>h", function()
			harpoon:list():add()
		end, { desc = "[h]arpoon file" })
		vim.keymap.set("n", "<M-h>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "show harpooned files" })

		vim.keymap.set("n", "<C-u>", function()
			harpoon:list():select(1)
		end, { desc = "harpoon 1" })
		vim.keymap.set("n", "<C-i>", function()
			harpoon:list():select(2)
		end, { desc = "harpoon 2" })
		vim.keymap.set("n", "<C-o>", function()
			harpoon:list():select(3)
		end, { desc = "harpoon 3" })
		vim.keymap.set("n", "<C-p>", function()
			harpoon:list():select(4)
		end, { desc = "harpoon 4" })
	end,
}
