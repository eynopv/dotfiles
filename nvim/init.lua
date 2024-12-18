require("plugins.plug")
require("plugins.lspconfig")
require("plugins.nvim-cmp")
require("plugins.formatter")
require("plugins.treesitter")
--require("plugins.dirvish")
require("plugins.oil")
require("plugins.mini_icons")

require("global.editor")
require("global.remap")

-- Jump to the last position when reopening a file
vim.cmd([[
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])

-- Safely add root node_modules/.bin to PATH if it exists to avoid installing packages globally,
-- maybe I should use pnpx command instead of just prettier
local root_node_bin = vim.fn.getcwd() .. "/node_modules/.bin"
if vim.fn.isdirectory(root_node_bin) == 1 then
	vim.env.PATH = root_node_bin .. ":" .. vim.env.PATH
end
