return {
	-- https://github.com/hrsh7th/nvim-cmp
	"hrsh7th/nvim-cmp",
	dependencies = {
		-- Snippet engine & its associated nvim-cmp source
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",

		-- Adds LSP completion capabilities
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",

		-- Adds a number of user-friendly snippets
		"rafamadriz/friendly-snippets",
	},
	event = "InsertEnter",
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			sources = cmp.config.sources({
				-- { name = "buffer" },   -- text within current buffer
				{ name = "luasnip" }, -- snippets
				{ name = "nvim_lsp" }, -- lsp
				{ name = "path" }, -- file system path
			}),
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll forward
				["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll backward
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
			}),
		})
	end,
}
