--vim.cmd([[
--set runtimepath^=~/.vim runtimepath+=~/.vim/after
--let &packpath = &runtimepath
--source ~/.vimrc
--]])

require("global.editor")

vim.cmd([[
let g:python3_host_prog = $HOME . '/miniconda3/bin/python3'
]])

require("plugins.plug")
vim.cmd([[
let g:skip_defaults_vim = 1
]])
require("global.remap")
require("plugins.lspconfig")
require("plugins.nvim-cmp")
require("plugins.formatter")

vim.cmd([[
" Formatter
augroup FormatAutogroup
  autocmd User FormatterPre lua print "This will print before formatting"
  autocmd User FormatterPost lua print "This will print after formatting"
augroup END
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END

]])

vim.cmd([[
" use darvish for explore
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
]])


vim.cmd([[
" theme config
let ayucolor="dark"
"colorscheme ayu
"colorscheme dracula
colorscheme gruvbox

"syntax on
]])


-- Jump to the last position when reopening a file
vim.cmd([[
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])
