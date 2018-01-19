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
" folding
set foldmethod=indent
" If .js or .html  or .hs expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype haskell setlocal ts=2 sw=2 expandtab
" Add ** to path for recursive fuzzy search in subdirectory
set path+=**
" this need ripgrep installed on the system to work (cargo install ripgrep)
command! -bang -nargs=* Find call fzf#vim#grep( 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)
