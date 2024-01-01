vim.g.mapleader = " "

vim.keymap.set('n', '<leader>d', ':Dirvish<CR>')
vim.keymap.set('n', '<leader>j', '<Plug>(dirvish_up)')

vim.keymap.set('n', '<leader>pv', ':Vex<CR>')
--vim.keymap.set('n', '<leader><CR>', ':so ~/.vimrc<CR>')
vim.keymap.set('n', '<C-p>', ':GFiles<CR>')
vim.keymap.set('n', '<C-f>', ':Files<CR>')
vim.keymap.set('n', '<leader>pf', ':Files<CR>')
vim.keymap.set('n', '<C-j>', ':cnext<CR>')
vim.keymap.set('n', '<C-k>', ':cprev<CR>')

-- yank into system clipboard
vim.keymap.set('v', '<C-y>', '"+y')
vim.keymap.set('n', '<C-y>', '"+y')

-- Make <TAB> to accept selected completion item or notify coc.nvim to format
--vim.keymap.set('inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm()

