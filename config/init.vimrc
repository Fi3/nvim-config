" Plugins
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-fireplace'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-vividchalk'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/syntastic'
" elmcast must load before wim-polyglot https://github.com/ElmCast/elm-vim/issues/133
Plug 'elmcast/elm-vim'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'jszakmeister/vim-togglecursor'
Plug 'flowtype/vim-flow'
Plug 'vim-scripts/paredit.vim'
Plug 'tpope/vim-surround'
Plug 'breuckelen/vim-resize'
Plug 'parsonsmatt/intero-neovim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neomake/neomake'
call plug#end()
