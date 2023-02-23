" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
"runtime! debian.vim

" SETTERS
set nocompatible
set number
set relativenumber
set scrolloff=8
set textwidth=100
set colorcolumn=+2
set showmatch
set visualbell

set hlsearch
set ignorecase
set smartcase

set autoindent
set shiftwidth=4
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set smarttab

set backspace=indent,eol,start
set termguicolors     " enable true colors support

" PLUGINS
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'wuelnerdotexe/vim-astro'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'justinmk/vim-dirvish'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()

let g:skip_defaults_vim = 1

" coc configs
let g:coc_node_path = '/home/eynopv/.nvm/versions/node/v18.12.0/bin/node'
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = [ 'coc-eslint', 'coc-json', 'coc-tsserver', 'coc-pyright', 'coc-rust-analyzer' ]

" use darvish for explore
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>

" prettier config
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0

" theme config
let ayucolor="dark"
colorscheme ayu

syntax on

" REMAPS
let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.vimrc<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
" yank into system clipboard
vnoremap <C-y> "+y
nnoremap <C-y> "+y
" Make <TAB> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<TAB>"

" MISC
" Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
