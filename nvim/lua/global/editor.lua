vim.o.number = true
vim.o.relativenumber = true

vim.o.visualbell = true

vim.o.tabstop = 2 -- display tabs as 2 spaces
vim.o.shiftwidth = 2 -- indent with 2 spaces
vim.o.softtabstop = 2 -- backspace treats 2 spaces as tab
vim.o.expandtab = true -- use spaces instead of tabs
vim.o.smartindent = false -- automatically indents new lines based on syntax (mainly for C-like languages)

local undoDir = vim.fn.stdpath("state") .. "/undo"
vim.fn.mkdir(undoDir, "p")
vim.o.undodir = undoDir
vim.o.undofile = true
vim.o.swapfile = false

vim.o.hlsearch = true
vim.o.incsearch = true

vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.o.isfname = vim.o.isfname .. ",@-@"

vim.o.updatetime = 50

vim.o.wrap = true
vim.o.colorcolumn = "100"

vim.o.backspace = "indent,eol,start"

vim.o.termguicolors = true

vim.cmd.colorscheme("gruvbox")

-- diagnostic
vim.diagnostic.config({
	virtual_text = true,
})

vim.o.spell = true
vim.o.spelllang = "en_us"
