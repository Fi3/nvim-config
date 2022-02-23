"custom key-bindings

" map jk to <ESC> fucking new mac
imap jk <ESC>
imap DD {:#?}
imap DDD println!("{:#?}", 
imap WW .map_err(\|_\| ())?; 

" clean the screnn with l (^l is used to change desktop)
map ; <C-l> 

map , :NERDTreeFind<return> 

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
