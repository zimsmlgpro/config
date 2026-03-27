return {
	-- Mason: installs LSP servers
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry", -- needed for roslyn (C#)
				},
			})
		end,
	},

	-- Bridges mason and lspconfig together
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"vtsls", -- TypeScript/JavaScript
					"pyrefly", -- Python
					"sqlls", -- SQL
					"clangd", -- C++
					"svelte",
					"lua_ls",
					"cssls",
					"html",
					"jsonls",
					"yamlls",
					"cmake",
					"cssmodules_ls",
					"intelephense",
					"lemminx",
					"powershell_es",
					"tailwindcss",
					"vimls",
				},
				automatic_installation = true,
			})
		end,
	},

	-- nvim-lspconfig: provides server configs, works with new vim.lsp.config API
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- Shared keymaps on LSP attach
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local opts = { buffer = ev.buf }

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
					vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, opts)
				end,
			})

			-- Diagnostic display settings
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					border = "rounded",
					source = true,
				},
			})

			-- Enable LSP servers via new API
			vim.lsp.enable({
				"ts_ls",
				"pyright",
				"sqlls",
				"clangd",
			})
		end,
	},

	-- Roslyn LSP for C#
	{
		"seblyng/roslyn.nvim",
		ft = "cs",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("roslyn").setup({
				config = {
					capabilities = vim.lsp.protocol.make_client_capabilities(),
				},
			})
		end,
	},
}
