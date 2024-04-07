vim.cmd([[
call plug#begin()

" Syntax highlights
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Formatter
Plug 'mhartington/formatter.nvim'

" Navigator
Plug 'justinmk/vim-dirvish'

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

call plug#end()
]])
