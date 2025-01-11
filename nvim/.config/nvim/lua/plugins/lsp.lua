-- :help lsp
return {
	-- https://github.com/williamboman/mason-lspconfig.nvim
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		-- https://github.com/williamboman/mason.nvim
		"williamboman/mason.nvim",
		-- https://github.com/neovim/nvim-lspconfig
		"neovim/nvim-lspconfig",
		{
			-- https://github.com/folke/lazydev.nvim
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		-- Ctrl + x Ctrl + o (:help ins-completion - brings up completion for vim globals)
		-- Ctrl + ] (go to definition)
		-- Ctrl + t (go back from definition)
		-- =G (format file)
		-- K (shows help info in normal mode) (press K a second time to jump into the buffer)
		vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "rename symbol" })
		vim.keymap.set("n", "gra", vim.lsp.buf.code_action, { desc = "see code actions" })
		vim.keymap.set("n", "grr", vim.lsp.buf.references, { desc = "get references" })
		vim.keymap.set("n", "gri", vim.lsp.buf.implementation, { desc = "go to implementation" })
		vim.keymap.set(
			"n",
			"gO",
			vim.lsp.buf.document_symbol,
			{ desc = "list all symbols in the current buffer in the quickfix list" }
		)
		vim.keymap.set(
			"i",
			"<C-S>",
			vim.lsp.buf.signature_help,
			{ desc = "show signature information for current argument" }
		)

		require("mason").setup()

		-- List of formatters to install:
		-- black
		-- isort
		-- clang-format
		-- stylua

		---@diagnostic disable-next-line: missing-fields
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"clangd",
				"lua_ls",
				"marksman",
				"pylsp",
				"ruff",
				"rust_analyzer",
				"taplo",
				"yamlls",
			},
		})

		-- Call setup on each LSP server
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
				})
			end,
		})

		-- Format on save for buffers that don't work with none-ls
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if not client then
					return
				end

				if client.supports_method("textDocument/formatting") then
					-- Format the current buffer on save
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = args.buf,
						callback = function()
							vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
						end,
					})
				end
			end,
		})

		-- Additional LSP settings
		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		})

		-- Disable all formatting and linting because I am using Ruff for that
		-- I just want the LSP part of this
		require("lspconfig").pylsp.setup({
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

		require("lspconfig").clangd.setup({
			on_attach = function()
				vim.keymap.set(
					"n",
					"<leader>sf",
					"<cmd>ClangdSwitchSourceHeader<cr>",
					{ desc = "switch between source and header file" }
				)
			end,
		})
	end,
}
