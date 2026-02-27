return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			ensure_installed = { "clangd", "lua_ls" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(client, bufnr)
				-- Make keymaps buffer-local so they only exist when an LSP is attached
				local function map(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
				end
				map("gd", vim.lsp.buf.definition, "[g]oto [d]efinition")
				map("gD", vim.lsp.buf.declaration, "[g]oto [D]eclaration")
				map("gr", function()
					vim.lsp.buf.references({ includeDeclaration = false })
				end, "[g]oto [r]eferences")
				map("gi", vim.lsp.buf.implementation, "[g]oto [i]mplementations")

				client.server_capabilities.documentFormattingProvider = true
			end

			local lsp_flags = {
				allow_incremental_sync = true,
				debounce_text_changes = 150,
			}

			-- Bash
			lspconfig.bashls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- Lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- C/C++ (clangd)
			lspconfig.clangd.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				cmd = { "clangd", "--background-index", "--clang-tidy" },
				init_options = {
					clangdFileStatus = true,
					fallbackFlags = { "--std=c++98" },
				},
				flags = lsp_flags,
			})
		end,
	},
}
