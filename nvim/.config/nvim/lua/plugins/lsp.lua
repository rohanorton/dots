return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						cargo = { allFeatures = true },
						check = { command = "clippy" },
					},
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, desc = "Definition" })
					vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = event.buf, desc = "References" })
					vim.keymap.set(
						"n",
						"gi",
						vim.lsp.buf.implementation,
						{ buffer = event.buf, desc = "Implementation" }
					)
					vim.keymap.set(
						"n",
						"gt",
						vim.lsp.buf.type_definition,
						{ buffer = event.buf, desc = "Type definition" }
					)

					vim.keymap.set("n", "cd", vim.lsp.buf.rename, { buffer = event.buf, desc = "Rename" })
					vim.keymap.set(
						{ "n", "v" },
						"<leader>ca",
						vim.lsp.buf.code_action,
						{ buffer = event.buf, desc = "Code action" }
					)

					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf, desc = "Hover" })
				end,
			})
		end,
	},
}
