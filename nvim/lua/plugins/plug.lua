vim.cmd([[
call plug#begin()

" Syntax highlights
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'branch': 'master' }

" Formatter
Plug 'mhartington/formatter.nvim'

" Navigator
Plug 'justinmk/vim-dirvish'
Plug 'stevearc/oil.nvim'
Plug 'echasnovski/mini.nvim', { 'branch': 'main' }

" Fuzzy finder
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'

" Color Schemes
Plug 'Shatur/neovim-ayu'
Plug 'Mofiqul/dracula.nvim'
Plug 'ellisonleao/gruvbox.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'

" Auto Complete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Git
Plug 'tpope/vim-fugitive'

call plug#end()
]])
