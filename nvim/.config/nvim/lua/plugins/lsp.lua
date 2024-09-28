return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"j-hui/fidget.nvim",
		"folke/neodev.nvim",
	},
	config = function()
		require("neodev").setup({})
		require("fidget").setup({})

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"clangd",
				"cmake",
				"jdtls",
				"lua_ls",
				"marksman",
				--"pylsp", version 1.12.0 breaks config
				"rust_analyzer",
			},
			auto_install = true,
		})

		-- Setup lanuage servers
		local lspconfig = require("lspconfig")
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lsp_attach = function(client, bufnr)
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, { desc = "[g]o to [d]efinition" })

			vim.keymap.set("n", "gD", function()
				vim.lsp.buf.declaration()
			end, { desc = "[g]o to [D]eclaration" })

			vim.keymap.set("n", "gr", function()
				vim.lsp.buf.references()
			end, { desc = "[g]et [r]eferences" })

			vim.keymap.set("n", "gi", function()
				vim.lsp.buf.implementation()
			end, { desc = "[g]o to [i]mplementation" })

			vim.keymap.set("n", "<C-s>", function()
				vim.lsp.buf.hover()
			end, { desc = "show help" })

			vim.keymap.set("i", "<C-s>", function()
				vim.lsp.buf.signature_help()
			end, { desc = "signature help" })

			vim.keymap.set("n", "<leader>rs", function()
				vim.lsp.buf.rename()
			end, { desc = "[r]ename [s]ymbol" })

			vim.keymap.set("n", "<leader>sd", function()
				vim.diagnostic.open_float()
			end, { desc = "[s]how [d]iagnostics" })

			vim.keymap.set({ "n", "v" }, "<leader>ca", function()
				vim.lsp.buf.code_action()
			end, { desc = "show [c]ode [a]ctions" })
		end

		-- Call setup on each LSP server
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					on_attach = lsp_attach,
					capabilities = lsp_capabilities,
				})
			end,
		})

		-- LSP settings
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		})

		lspconfig.pylsp.setup({
			settings = {
				pylsp = {
					plugins = {
						autopep8 = {
							enabled = false,
						},
						yapf = {
							enabled = false,
						},
						rope_rename = {
							enabled = false,
						},
						flake8 = {
							enabled = false,
						},
						mccabe = {
							enabled = false,
						},
						pycodestyle = {
							enabled = false,
						},
						pyflakes = {
							enabled = false,
						},
						pylint = {
							enabled = false,
						},
					},
				},
			},
		})
	end,
}
