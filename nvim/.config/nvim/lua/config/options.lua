local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- UI
opt.signcolumn = "yes"
opt.termguicolors = true
opt.wrap = false
opt.scrolloff = 5
opt.sidescrolloff = 5

-- splits
opt.splitbelow = true
opt.splitright = true

-- undo
opt.undofile = true

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- Update timings
opt.updatetime = 250
opt.timeoutlen = 300

-- Whitespace
opt.list = true
opt.listchars = {
	tab = "→ ",
	trail = "·",
	nbsp = "␣",
}

-- Cursorline
opt.cursorline = true
