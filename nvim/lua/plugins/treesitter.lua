-- Treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	event = "VeryLazy",
	opts = {
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
		ensure_installed = {
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"bash",
			"python",
			"rust",
		},
		auto_install = true,
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
