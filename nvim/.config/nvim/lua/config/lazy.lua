local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},

	install = {
		colorscheme = { "tokyonight" },
	},

	checker = {
		enabled = true, -- check for updates in the background
		notify = false, -- don't interrupt startup
	},

	change_detection = {
		notify = false,
	},
})
