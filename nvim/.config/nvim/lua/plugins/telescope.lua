return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<C-p>",
			function()
				require("telescope.builtin").find_files({
					attach_mappings = function(prompt_bufnr, map)
						map({ "i", "n" }, "<C-p>", function()
							require("telescope.actions").close(prompt_bufnr)

							require("telescope.builtin").oldfiles({
								cwd_only = true,
							})
						end)

						return true
					end,
				})
			end,
		},
		-- {
		--   "<leader>fg",
		--   function()
		--     require("telescope.builtin").live_grep()
		--   end,
		-- },
		-- {
		--   "<leader>fr",
		--   function()
		--     require("telescope.builtin").oldfiles()
		--   end,
		-- },
	},
}
