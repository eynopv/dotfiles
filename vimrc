
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim


set nocompatible              " be iMproved, required
filetype off                  " required

" config for vim-plug
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
call plug#end()

let g:coc_node_path = '/home/eynopv/.nvm/versions/node/v18.12.0/bin/node'
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = [ 'coc-json', 'coc-tsserver', 'coc-pyright' ]

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Make <TAB> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<TAB>"

" config for vundle
" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'

"Plugin 'ycm-core/YouCompleteMe'
"Plugin 'evanleck/vim-svelte'

"call vundle#end()            " required
"filetype plugin indent on    " required



" To ignore plugin indent changes, instead use:
"filetype plugin on

let g:skip_defaults_vim = 1

set background=dark

" Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on


" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

" Enable mouse usage (all modes)
"set mouse=a

set number
set linebreak
set showbreak=++
set textwidth=100
set showmatch
set visualbell

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2

set ruler

set backspace=indent,eol,start

syntax on

