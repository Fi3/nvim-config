" Set no tabs
set tabstop=2 expandtab

" split windows no bar
"set fillchars+=vert:|
"set fillchars+=vert:\
set fillchars+=vert:*

let mapleader=" "
set number
set noswapfile

" Copy paste from system cliboard
set mouse=

" Show the matching part of the pair for [] {} and ()
set showmatch

" Highlight in markdown
autocmd BufNewFile,BufRead *.md set spell | set lbr | set nonu
let g:markdown_fenced_languages = ['html', 'json', 'css', 'javascript', 'elm', 'vim']

" Folding
set foldmethod=indent

" Save file with sudo when opened without sudo
command Wsudo :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Visualize 100 char max length
set colorcolumn=100

" Persist undo
set undofile

" Mouse events
set mouse=a

" Enable syntax highlighting and file type identification, plugin and indenting
syntax enable
filetype plugin indent on
