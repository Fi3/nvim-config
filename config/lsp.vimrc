""" Language Server Protocol (LSP) settings """

lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

nvim_lsp.sumneko_lua.setup{}

-- Rust
local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                -- checkOnSave = {
                --     command = "clippy"
                -- },
            }
        }
    },
}
require('rust-tools').setup(opts)

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

-- Python via pyls https://github.com/palantir/python-language-server
nvim_lsp.pyls.setup{}

-- Not good enough
-- Javascript via tsserver https://github.com/theia-ide/typescript-language-server
-- nvim_lsp.tsserver.setup{}
-- Not good enough
-- nvim_lsp.flow.setup{}

-- Elm via elmls https://github.com/elm-tooling/elm-language-server#installation
-- install with :LspInstall elmls
nvim_lsp.elmls.setup{}

-- HTML via html https://github.com/vscode-langservers/vscode-html-languageserver-bin
nvim_lsp.html.setup{}

-- Clojure via clojure_lsp https://github.com/snoe/clojure-lsp
-- just put latest binary in path https://github.com/snoe/clojure-lsp/releases/tag/release-20201009T224414
nvim_lsp.clojure_lsp.setup{}


-- SQL via sqlls https://github.com/joe-re/sql-language-server
-- install with :LspInstall sqlls
nvim_lsp.sqlls.setup{}

-- CSS via cssls https://github.com/vscode-langservers/vscode-css-languageserver-bin
nvim_lsp.cssls.setup{}

-- C++ via clangd https://clangd.llvm.org/installation.html
-- for non cmake project bear need to be in the path: https://github.com/rizsotto/Bear
-- build projects with bear [build command] in order to enable the language server
nvim_lsp.clangd.setup{}

EOF

" Code navigation shortcuts
nnoremap <silent> <g2> <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <g3> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

" Code actions
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<cr>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<cr>

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }
