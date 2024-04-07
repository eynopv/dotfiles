require("plugins.plug")
require("plugins.lspconfig")
require("plugins.nvim-cmp")
require("plugins.formatter")
require("plugins.treesitter")
require("plugins.dirvish")

require("global.editor")
require("global.remap")

-- Jump to the last position when reopening a file
vim.cmd([[
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])
