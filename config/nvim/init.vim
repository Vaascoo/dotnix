set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set number
set relativenumber
set ignorecase
set smartcase
set nohlsearch
set nowrap
set clipboard+=unnamedplus
set undofile
set undodir=/tmp/
set showtabline

let mapleader = ","
set termguicolors
let background = "dark"
set completeopt=menu,menuone,noselect

tnoremap <Esc> <C-\><C-n>
vnoremap < <gv
vnoremap > >gv
autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
