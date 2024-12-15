return {
	{
		-- https://github.com/folke/tokyonight.nvim
		"folke/tokyonight.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanagawa-wave")
		end,
	},
	{
		-- Theme inspired by Atom
		"navarasu/onedark.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("onedark")
		end,
	},
	{
		"rose-pine/neovim",
		enabled = false,
		lazy = false,
		priority = 1000,
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				styles = {
					italic = false,
				},
			})
			-- vim.cmd.colorscheme("rose-pine-main")
			vim.cmd.colorscheme("rose-pine-moon")
			-- vim.cmd.colorscheme("rose-pine-dawn")
		end,
	},
}
