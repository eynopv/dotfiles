vim.g.mapleader = " "

vim.keymap.set('n', '<leader>d', ':Dirvish<CR>')
vim.keymap.set('n', '<leader>j', '<Plug>(dirvish_up)')

vim.keymap.set('n', '<leader>pv', ':Vex<CR>')
vim.keymap.set('n', '<C-p>', ':GFiles<CR>')
vim.keymap.set('n', '<C-f>', ':Files<CR>')
vim.keymap.set('n', '<C-j>', ':cnext<CR>')
vim.keymap.set('n', '<C-k>', ':cprev<CR>')

-- yank into system clipboard
vim.keymap.set('v', '<C-y>', '"+y')
vim.keymap.set('n', '<C-y>', '"+y')

-- Open diagnostic with nvim-lsp
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
