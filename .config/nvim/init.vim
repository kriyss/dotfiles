" https://github.com/junegunn/vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" General plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'

" Language support
Plug 'fatih/vim-go',					{ 'do': ':GoUpdateBinaries' }	" Go support

Plug 'blb78/nord-vim'								" color sheme
Plug 'blueyed/vim-diminactive'						" disable unactive pane
Plug 'https://github.com/tpope/vim-fugitive.git'	" Support for git

call plug#end()


"----------------------------------------------
" General settings
"----------------------------------------------
set autoindent					  " take indent for new line from previous line
set autoread					  " reload file if the file changes on the disk
set autowrite					  " write when switching buffers
set autowriteall				  " write on :quit
set clipboard=unnamedplus
set completeopt-=preview		  " remove the horrendous preview window
set cursorline					  " highlight the current line for the cursor
set encoding=utf-8
set lazyredraw
set list						  " show trailing whitespace
set listchars=tab:\|\ ,trail:▫
set listchars+=space:·
set nospell						  " disable spelling
set noswapfile					  " disable swapfile usage
set nowrap
set noerrorbells				  " No bells!
set novisualbell				  " I said, no bells!
set ruler
set formatoptions=tcqronj		  " set vims text formatting options
set title						  " let vim set the terminal title
set updatetime=100				  " redraw the status bar often
set number relativenumber

" File Format
set tabstop=4						" Number of spaces that a <Tab> in the file counts for
set softtabstop=4					" Number of spaces that a <Tab> counts for while performing editing operations
set shiftwidth=4					" Number of spaces to use for each step of (auto)indent<Paste>
set noexpandtab						" Use tabs, not spaces
%retab!								" Retabulate the whole file

:augroup number_toggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter	* set norelativenumber
:augroup END

:augroup number_color_toggle
	autocmd!
	autocmd InsertEnter * highlight LineNr ctermbg=green		guifg=#A3BE8C
	autocmd InsertLeave * highlight LineNr ctermbg=black		guifg=#4C566A
:augroup END

" Allow vim to set a custom font or color for a word
syntax enable

" Set the leader button
let mapleader = ','

nnoremap ; :

nnoremap <leader>m :Marks<cr>
nnoremap <leader>b :Buffers<cr>

vnoremap <leader>e ctmp<esc>Otmp:=<esc>p
vnoremap <leader>ev ctmp<esc>Otmp:=<esc>p:%s/tmp//g<left><left>
vnoremap <leader>evc ctmp<esc>Otmp:=<esc>p:%s/tmp//gc<left><left><left>
nnoremap <leader>r viw"hy:%s/<C-r>h//g<left><left>
nnoremap <leader>rc viw"hy:%s/<C-r>h//gc<left><left><left>

" Center the screen quickly
nnoremap <space> zz

" Autosave buffers before leaving them
autocmd BufLeave * silent! :wa

" Remove trailing white spaces on save
autocmd BufWritePre * :%s/\s\+$//e

"----------------------------------------------
" Colors
"----------------------------------------------
if exists('+termguicolors')
	let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
" colorscheme flattened_light

let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 20
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1
colorscheme nord

"----------------------------------------------
" Fonts
"----------------------------------------------
filetype plugin indent on
set guifont=Devicons\ 11

"----------------------------------------------
" Searching
"----------------------------------------------
set incsearch					  " move to match as you type the search query
set hlsearch					  " disable search result highlighting

if has('nvim')
	set inccommand=split		  " enables interactive search and replace
endif

" Clear search highlights
map <leader>c :nohlsearch<cr>

" These mappings will make it so that going to the next one in a search will
" center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Next and previous error on quicklist
nnoremap <leader>o :lopen<cr>
nnoremap <leader>n :lnext<cr>zz
nnoremap <leader>p :lprevious<cr>zz

"----------------------------------------------
" Splits
"----------------------------------------------
set splitbelow
set splitright

" Creating splits
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>
nnoremap <leader>q :close<cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"----------------------------------------------
" Plugin: junegunn/fzf.vim
"----------------------------------------------
let g:fzf_layout = { 'down': '~40%' }
nnoremap <C-f> :FZF<cr>

"----------------------------------------------
" Plugin: vim-airline/vim-airline
"----------------------------------------------
" Show status bar by default.
set laststatus=2

" Disable showing tabs in the tabline. This will ensure that the buffers are
" what is shown in the tabline at all times.
let g:airline#extensions#tabline#show_tabs = 0

" Enable powerline fonts.
let g:airline_powerline_fonts = 1

"----------------------------------------------
" Language: Golang
"----------------------------------------------
:augroup go_abbrev
	au FileType go iabbrev ifer if err!= nil {<cr>}<esc>O
	au FileType go iabbrev ;= :=
	au FileType go iabbrev #t *testing.T
	au FileType go iabbrev #f func(){}
	au FileType go iabbrev #s type struct{}
	au FileType go iabbrev #i type interface{}
:augroup END

:augroup go_binding
	autocmd Filetype go inoremap <buffer> . .<C-x><C-o>
	autocmd Filetype go nmap <leader>gt		:GoTest<cr>
	autocmd Filetype go nmap <leader>gtf	:GoTestFunc<cr>
	autocmd FileType go nmap <leader>gc		<Plug>(go-coverage-toggle)
	autocmd Filetype go nmap <leader>ga		<Plug>(go-alternate-edit)
	autocmd Filetype go nmap <leader>gah	<Plug>(go-alternate-split)
	autocmd Filetype go nmap <leader>gav	<Plug>(go-alternate-vertical)
	autocmd FileType go nmap <leader>gd		<Plug>(go-def)
	autocmd FileType go nmap <leader>gdv	<Plug>(go-def-vertical)
	autocmd FileType go nmap <leader>gdh	<Plug>(go-def-split)
	autocmd FileType go nmap <leader>gD		<Plug>(go-doc)
	autocmd FileType go nmap <leader>gDv	<Plug>(go-doc-vertical)
	autocmd FileType go nmap <leader>gi		:GoImplements<cr>
	autocmd FileType go nmap <leader>gr		:GoReferrers<cr>
	autocmd FileType go nmap <leader>gC		:GoCallees<cr>
	autocmd FileType go nmap <leader>gp		:call GoSetPwd()<cr>
:augroup END

:augroup go_auto_build_save
	autocmd!
	autocmd BufWritePost *.go :GoBuild
	autocmd BufWritePost *.go :GoTest
:augroup END

:augroup go_config
	let g:go_highlight_function_calls = 1
	let g:go_fmt_command = "goimports"				" Run goimports when running gofmt
	let g:go_echo_command_info = 1					" Show the progress when running :GoCoverage
	let g:go_auto_type_info = 1						" Show type information
	let g:go_auto_sameids = 0						" Highlight variable uses
	let g:go_list_type = "quickfix"					" Fix for location list when vim-go is used together with Syntastic
	let g:go_test_show_name = 1						" Add the failing test name to the output of :GoTest
	let g:go_addtags_transform = "camelcase"		" Set whether the JSON tags should be snakecase or camelcase.
:augroup END

let g:ale_linters = {'go': ['golangci-lint']}
let g:ale_go_golangci_lint_executable = '/home/kriyss/go/bin/golangci-lint'
let g:ale_go_golangci_lint_options = '--fast  --out-format=tab'
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

let g:airline#extensions#ale#enabled = 1 " Enable integration with airline.

" Set gopath and gobin
let $GOPATH=getcwd()
let $GOBIN='/home/kriyss/go/bin'

function! GoSetPwd()
	let $GOPATH='/home/kriyss/go'
endfunction



hi! def		 goCoverageCovered	  ctermfg=cyan	guibg=#485962
hi! def		 goCoverageUncover	  ctermfg=red	guibg=#7A515B
