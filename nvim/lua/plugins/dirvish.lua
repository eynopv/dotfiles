vim.cmd([[
" use darvish for explore
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
]])
