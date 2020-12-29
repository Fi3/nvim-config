set number
" Set no tabs
set tabstop=2 expandtab

" split windows no bar
"set fillchars+=vert:|
"set fillchars+=vert:\
set fillchars+=vert:*

" use map instead of let for mapping the leader (now also \ is the leader)
" https://www.reddit.com/r/vim/comments/1vdrxg/space_is_a_big_key_what_do_you_map_it_to/
map <space> <leader>
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

" New line after 100 char
set textwidth=100
" If file type is markdown do not count not rendered chars
lua <<EOF
-- TODO
EOF

" Persist undo
set undofile

" Mouse events
set mouse=a

" Enable syntax highlighting and file type identification, plugin and indenting
syntax enable
filetype plugin indent on

" Copy to clipboard
" To copy on system clipoard on linx nee xclip installed `sudo dnf install xclip`
" If no xclip installed but on a tmux session will copy on the tmux buffer
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
" To paste on system clipoard on linx nee xclip installed `sudo dnf install xclip`
" If no xclip installed but on a tmux session will paste on the tmux buffer
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
