return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				-- Lua / Neovim config
				"lua_ls",

				-- TypeScript / JS / JSON / CSS / HTML
				"vtsls",
				"jsonls",

				-- Shell
				"bashls",
				"fish_lsp",

				-- Rust
				"rust_analyzer",

				-- YAML
				"yamlls",

				-- Markdown
				"marksman",

				-- SQL
				"sqls",
			},
			automatic_enable = true,
		},
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"prettier",
				"shfmt",
				"shellcheck",
			},
		},
	},
}
