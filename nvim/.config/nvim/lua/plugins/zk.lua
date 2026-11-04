return {
	{
		"zk-org/zk-nvim",
		config = function()
			require("zk").setup({
				picker = "telescope",
				lsp = {
					config = {
						cmd = { "zk", "lsp" },
						name = "zk",
					},
					auto_attach = {
						enabled = true,
					},
				},
			})

			vim.keymap.set("n", "<leader>zn", "<cmd>ZkNew<CR>", { desc = "New note" })
			vim.keymap.set("n", "<leader>zf", "<cmd>ZkNotes<CR>", { desc = "Find notes" })
			vim.keymap.set("n", "<leader>zt", "<cmd>ZkTags<CR>", { desc = "Find tags" })
			vim.keymap.set("n", "<leader>zl", "<cmd>ZkLinks<CR>", { desc = "Note links" })
			vim.keymap.set("n", "<leader>zb", "<cmd>ZkBacklinks<CR>", { desc = "Backlinks" })
			vim.keymap.set("n", "<leader>zd", "<cmd>ZkNew { group = 'daily' }<CR>", { desc = "Daily note" })
		end,
	},
}
