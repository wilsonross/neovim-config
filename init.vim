call plug#begin('~/.config/nvim/plugged')

" Theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Copilot
Plug 'github/copilot.vim'

" Parentheses autocomplete
Plug 'Raimondi/delimitMate'

" Language server
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" File explorer
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" Icons - should be last
Plug 'ryanoasis/vim-devicons'

call plug#end()

colorscheme dracula

let mapleader=" "
let loaded_netrw = 1
let loaded_netrwPlugin = 1
