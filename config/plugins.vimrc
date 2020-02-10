" COLORSCHEME synthwave
" Gruvbox TODO do not work for js and do not match []{}()
" colorscheme synthwave

" COLORSCHEME sharkbites
set background=dark
syntax enable
colorscheme sharkbites
let g:airline_theme = 'sharkbites'
set termguicolors

" Airline
let g:airline_left_sep= '░'
let g:airline_right_sep= '░'

" NerdTree
map <LEADER>f :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 24
let g:NERDTreeMinimalUI = 1
autocmd VimEnter * if (0 == argc()) | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NetRw
let g:netrw_liststyle = 3      " treestyle visualization
let g:netrw_browse_split = 4   " open file to next wind on the right
let g:netrw_altv = 1
let g:netrw_winsize = 15
let g:netrw_banner = 0

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:airline#extensions#syntastic#enabled = 0
" Syntastic local linter support
let g:syntastic_javascript_checkers = []

function CheckJavaScriptLinter(filepath, linter)
	if exists('b:syntastic_checkers')
		return
	endif
	if filereadable(a:filepath)
		let b:syntastic_checkers = [a:linter]
		let {'b:syntastic_' . a:linter . '_exec'} = a:filepath
	endif
endfunction

function SetupJavaScriptLinter()
	let l:current_folder = expand('%:p:h')
	let l:bin_folder = fnamemodify(syntastic#util#findFileInParent('package.json', l:current_folder), ':h')
	let l:bin_folder = l:bin_folder . '/node_modules/.bin/'
	call CheckJavaScriptLinter(l:bin_folder . 'standard', 'standard')
	call CheckJavaScriptLinter(l:bin_folder . 'eslint', 'eslint')
endfunction

autocmd FileType javascript call SetupJavaScriptLinter()


" Elm
let g:polyglot_disabled = ['elm']
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1

" intero (haskell)
augroup interoMaps
  au!
  " Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>

  " Reloading (pick one)
  " Automatically reload on save
  au BufWritePost *.hs InteroReload
  " Manually save and reload
  au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  " Heads up! These next two differ from the rest.
  au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
  au FileType haskell map <silent> <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  au FileType haskell nnoremap <silent> <leader>gd :InteroGoToDef<CR>

augroup END

" Intero starts automatically. Set this if you'd like to prevent that.
let g:intero_start_immediately = 0

" rust-racer setup
set hidden
let g:racer_cmd = "/home/user/.cargo/bin/racer"

" rust-racer show complete function definition
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

" rust-racer mappings
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap gd <Plug>(rust-doc)

" toogle tagbar with F8
nmap <F8> :TagbarToggle<CR>

" rust tagbar configuration
let g:tagbar_type_rust = {
   \ 'ctagstype' : 'rust',
   \ 'kinds' : [
       \'T:types,type definitions',
       \'f:functions,function definitions',
       \'g:enum,enumeration names',
       \'s:structure names',
       \'m:modules,module names',
       \'c:consts,static constants',
       \'t:traits',
       \'i:impls,trait implementations',
   \]
   \}

" vim-rust copy RustFmt link to clipboard
let g:rust_clip_command = 'xclip -selection clipboard'
