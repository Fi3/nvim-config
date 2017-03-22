let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
" split windows no bar
set fillchars+=vert:\
let mapleader=" "
set number
set noswapfile
" autocomplete
set completeopt=longest,menuone
" copy paste from system cliboard
set mouse=
" show the matching part of the pair for [] {} and ()
set showmatch
" highlight in markdown
autocmd BufNewFile,BufRead *.md set spell | set lbr | set nonu
let g:markdown_fenced_languages = ['html', 'json', 'css', 'javascript', 'elm', 'vim']
