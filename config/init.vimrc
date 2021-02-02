" Plugins
call plug#begin()
" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-vividchalk'
Plug 'TroyFletcher/vim-colors-synthwave'
Plug 'kenwheeler/glow-in-the-dark-gucci-shark-bites-vim'
Plug 'sainnhe/edge'
" Vim defaults
Plug 'tpope/vim-sensible'
" Resize screen using arrow keys
Plug 'breuckelen/vim-resize'
" Git support
Plug 'tpope/vim-fugitive'
Plug 'TimUntersberger/neogit'
" Clojure support TODO check if still needed after LSP
Plug 'tpope/vim-fireplace'
" Syntax highlight for several languages
" Plug 'sheerun/vim-polyglot'
" Status bar
Plug 'itchyny/lightline.vim'
" Nerdtree
Plug 'scrooloose/nerdtree'
" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
" Extensions to built-in LSP, for example, providing type inlay hints
Plug 'tjdevries/lsp_extensions.nvim'
" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'
" Diagnostic navigation and settings for built-in LSP
" Plug 'nvim-lua/diagnostic-nvim'
" Syntastic only for js
Plug 'scrooloose/syntastic'
" Check english grammar
Plug 'rhysd/vim-grammarous'
" MarkDown support
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()
