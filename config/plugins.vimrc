" COLORSCHEME edge
if has('termguicolors')
  set termguicolors
endif
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" The configuration options should be placed before `colorscheme edge`.
let g:edge_style = 'neon'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1
" Available values: `'auto'`, `'red'`, `'yellow'`, `'green'`, `'cyan'`
let g:edge_cursor = 'purple'

" lightline
let g:lightline = {'colorscheme' : 'edge'}

colorscheme edge

" COLORSCHEME synthwave
" Gruvbox TODO do not work for js and do not match []{}()
" colorscheme synthwave

" COLORSCHEME sharkbites
" set background=dark
" syntax enable
" colorscheme sharkbites
" let g:airline_theme = 'sharkbites'
" set termguicolors

" NerdTree
map <LEADER>f :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 24
let g:NERDTreeMinimalUI = 1
autocmd VimEnter * if (0 == argc()) | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" NetRw
let g:netrw_liststyle = 3      " treestyle visualization
let g:netrw_browse_split = 4   " open file to next wind on the right
let g:netrw_altv = 1
let g:netrw_winsize = 15
let g:netrw_banner = 0

"" rust.vim automatically format rust code on save
let g:rustfmt_autosave = 1

" Syntastic
" Only active for js files
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": ["javascript"],
    \ "passive_filetypes": [] }

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
