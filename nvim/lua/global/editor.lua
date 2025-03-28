vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.visualbell = true

vim.opt.tabstop = 2 -- display tabs as 2 spaces
vim.opt.shiftwidth = 2 -- indent with 2 spaces
vim.opt.softtabstop = 2 -- backspace treats 2 spaces as tab
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = false -- automatically indents new lines based on syntax (mainly for C-like languages)

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.wrap = true
vim.opt.colorcolumn = "100"

vim.opt.backspace = "indent,eol,start"

vim.opt.termguicolors = true

vim.cmd.colorscheme("gruvbox")

-- diagnostic
vim.diagnostic.config({
	virtual_text = true,
})
