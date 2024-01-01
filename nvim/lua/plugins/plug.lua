vim.cmd([[
call plug#begin()

Plug 'editorconfig/editorconfig-vim'
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'wuelnerdotexe/vim-astro'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'rust-lang/rust.vim'
Plug 'ziglang/zig.vim'
Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}

" Formatter
Plug 'mhartington/formatter.nvim'

" Navigator
Plug 'justinmk/vim-dirvish'

" Fuzzy finder
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'

" Color Schemes
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox', { 'as': 'gruvbox' }

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
