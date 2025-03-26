vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.visualbell = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
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
