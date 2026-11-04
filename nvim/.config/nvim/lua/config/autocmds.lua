local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local rohan = augroup("RohanConfig", { clear = true })

-- Clear search
autocmd("InsertEnter", {
	group = rohan,
	callback = function()
		vim.cmd("nohlsearch")
	end,
})

-- Format
autocmd("BufWritePre", {
	group = rohan,
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

-- Treesitter
autocmd("FileType", {
	group = rohan,
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

-- Create iabbrev for daily notes
local daily = require("daily")

autocmd({ "BufRead", "BufNewFile" }, {
	group = rohan,
	pattern = "*.md",
	callback = daily.attach,
})
