"GENERAL
set updatetime=100
set nocompatible
syntax on
filetype plugin indent on
set encoding=utf8
set expandtab
set shiftwidth=2
set softtabstop=2
set relativenumber

"NERDTREE
nmap <F6> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1

"AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='onedark'

"STYLING
colo one
set termguicolors
set background=dark
set term=xterm-256color
set t_Co=256
set fillchars+=vert:\ 
hi VertSplit guibg='#282c34' guifg='#282c34'
hi NonText guibg='#282c34' guifg='#282c34'
