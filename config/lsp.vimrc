""" Language Server Protocol (LSP) settings """

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Use diagnostic-nvim in every buffer
autocmd BufEnter * lua require'diagnostic'.on_attach()

" Configure LSP
" https://github.com/neovim/nvim-lspconfig
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'nvim_lsp'

-- Rust via rust analyzer https://github.com/rust-analyzer/rust-analyzer
nvim_lsp.rust_analyzer.setup{}

-- Python via pyls https://github.com/palantir/python-language-server
nvim_lsp.pyls.setup{}

-- Not good enough
-- Javascript via tsserver https://github.com/theia-ide/typescript-language-server
-- nvim_lsp.tsserver.setup{}
-- Not good enough
-- nvim_lsp.flow.setup{}

-- Elm via elmls https://github.com/elm-tooling/elm-language-server#installation
nvim_lsp.elmls.setup{}

-- HTML via html https://github.com/vscode-langservers/vscode-html-languageserver-bin
nvim_lsp.html.setup{}

-- Clojure via clojure_lsp https://github.com/snoe/clojure-lsp
nvim_lsp.clojure_lsp.setup{}

-- SQL via sqlls https://github.com/joe-re/sql-language-server
nvim_lsp.sqlls.setup{}

-- CSS via cssls https://github.com/vscode-langservers/vscode-css-languageserver-bin
nvim_lsp.cssls.setup{}

EOF

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" Code actions
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Visualize diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '40'
" Don't show diagnostics while in insert mode
let g:diagnostic_insert_delay = 1

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>PrevDiagnosticCycle<cr>
nnoremap <silent> g] <cmd>NextDiagnosticCycle<cr>

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }