vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "gy", '"+y')

vim.keymap.set("n", "gcc", "Vgc", { remap = true })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("v", "jk", "<Esc>")
vim.keymap.set("v", "kj", "<Esc>")

vim.keymap.set("n", "jk", "<cmd>w<cr>")
vim.keymap.set("n", "kj", "<cmd>w<cr>")

-- Diagnostics
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })

vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Line diagnostics" })
