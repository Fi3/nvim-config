"custom key-bindings

" map jk to <ESC> fucking new mac
imap jk <ESC>

" clean the screnn with l (^l is used to change desktop)
map ; <C-l> 

map , :NERDTreeFind<return> 

" Trigger completion with <Tab>
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
