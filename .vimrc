execute pathogen#infect('~/.vim/bundle/{}') 
set nocompatible
filetype plugin indent on
syntax on 
set noshowmode
set autowrite
set tabstop=4
set shiftwidth=4
set rnu
set hidden
"OLD SYNTASTIC STUFF -----------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1 
"let g:syntastic_enable_signs = 1 
"let g:syntastic_java_javac_config_file_enabled = 1
"let g:syntastic_enable_highlighting = 1
"----------------
"let g:ale_open_list = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let b:ale_fixers = ['google_java_format']
let g:ale_linters = {'c': ['gcc'], 'lua': ['luac'], 'cpp': ['g++'], 'python': ['flake8']}


set backspace=2
set backspace=indent,eol,start
let g:pymode_lint_ignore = "E226,E501,E302,W,E261"

set autochdir
set laststatus=2
set encoding=utf-8
set number
set ignorecase
set cmdheight=1
"-------------color stuff
colorscheme nord 
"highlight CursorLine ctermbg=Gray

nnoremap Z :lnext<cr>
inoremap jj <esc>
nnoremap <S-u> <C-r> 
"-------Syntax----------
set foldmethod=manual
set foldnestmax=1
let c_no_comment_fold =1

"let g:syntastic_python_checkers = ['flake8']
set nofoldenable
set hlsearch
set incsearch
set showcmd
"let g:syntastic_swift_checkers = ['swift']
inoremap <S-Tab> <C-P>
let mapleader=" " 
nnoremap \ za 
nnoremap <Tab> :b# <CR>
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap + <C-W>+
nnoremap - <C-W>-
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <S-m> '
nnoremap <Leader>3 :! cd ~/Desktop/Workspace/327 && git add . && git commit -m "autocmmit" && git push origin master
command W w
command Wq wq
command Wqa wqa
command Q q

set cursorline
"--------------Indentation
"let g:indentLine_conceallevel = 2
"let g:indentLine_enabled = 1
"let g:indentLine_color_term = 239
set listchars=tab:\│\ 
set list
" Gif config
""-------------INdentation end

"-- Remap / in vim to easymotion. Disabled because it cannot see inside folds
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)

function! Program_set()
"IndentGuidesToggle
		"set listchars=tab:\│\ 
		"set list!
		NERDTreeToggle %
		TagbarToggle
endfunction
nmap <F8> :<c-u>call Program_set()<CR>

hi Comment ctermfg=245

function! Execute_make_cpp()
	execute ":! make && ./red_black"
endfunction
function! Execute_cpp()
	call inputsave()
	let name = input('-o name:')
	call inputrestore()
	execute 'AsyncRun git add . && git commit -m % && git push origin master'
	if name == ""
		let name = "default"
	endif
	execute ":! g++-8 ".bufname("%")." -o ".name." && ./" . name 
endfunction

function! Execute_py()
	execute ":! python3 ".bufname("%")
endfunction

function! Execute_c()
	call inputsave()
	let name = input('-o name:')
	call inputrestore()
	if name == ""
		let name = "default"
	endif
	execute ":! gcc ".bufname("%")." -o ".name." && ./" . name 
endfunction

function! Execute_java()
	execute ":! javac ".bufname("%")."&& java " . substitute(bufname("%"),".java","","")  
endfunction

autocmd FileType cpp nmap <F6> :<c-u> call Execute_cpp()<CR>
autocmd FileType cpp nmap <F5> :<c-u> call Execute_make_cpp()<CR>
autocmd FileType c nmap <F6> :<c-u> call Execute_c()<CR>
autocmd FileType java nmap <F6> :<c-u> call Execute_java()<CR>
autocmd FileType python nmap <F6> :<c-u> call Execute_py()<CR>

"To handle brackets opening folds
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

set rtp+=/usr/local/opt/fzf
nnoremap gh :bprev<CR>
nnoremap gl :bnext<CR>
nnoremap tl :tabnext <CR>
nnoremap th :tabprev <CR>
nnoremap tm :tab sp<CR>
nnoremap tc :tabclose<CR>
nnoremap t1 :1gt<CR>
nnoremap t2 :2gt<CR>
nnoremap t3 :3gt<CR>
nnoremap t4 :4gt<CR>
nnoremap t5 :5gt<CR>
nnoremap t6 :6gt<CR>

nnoremap * <C-]>

nnoremap <Leader>f :FZF ~/Desktop/Workspace <CR>

hi Folded ctermbg=Grey
let g:airline#extensions#tabline#enabled = 1
let g:minimap_auto_start = 1
let g:minimap_width = 10

hi MinimapCurrentLine ctermfg=Red guifg=#50FA7B guibg=#32302f
let g:minimap_highlight = 'MinimapCurrentLine'
