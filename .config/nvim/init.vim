" https://github.com/junegunn/vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" General plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'dense-analysis/ale'
" Language support
Plug 'fatih/vim-go',					{ 'do': ':GoUpdateBinaries' }	" Go support
Plug 'deoplete-plugins/deoplete-go',	{ 'do': 'make' }				" Asynchronous GO completion

Plug 'blb78/nord-vim'
Plug 'blueyed/vim-diminactive'

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
" set number						  " show number ruler
set ruler
set formatoptions=tcqronj		  " set vims text formatting options
set title						  " let vim set the terminal title
set updatetime=100				  " redraw the status bar often


" File Format
set tabstop=4						" Number of spaces that a <Tab> in the file counts for
set softtabstop=4					" Number of spaces that a <Tab> counts for while performing editing operations
set shiftwidth=4					" Number of spaces to use for each step of (auto)indent<Paste>
set noexpandtab						" Use tabs, not spaces
%retab!								" Retabulate the whole file

" scroll windows
nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>
nnoremap <C-U> <C-R>

nnoremap <C-b> :NERDTreeToggle<cr>

iabbrev iferr if err!= nil {<cr>}<esc>O

set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter	* set norelativenumber
:augroup END

:augroup numberColorToggle
:  autocmd!
:  autocmd InsertEnter * highlight LineNr ctermbg=green		guifg=#A3BE8C
:  autocmd InsertLeave * highlight LineNr ctermbg=black		guifg=#4C566A
:augroup END

" Autoclose
" inoremap { {}<Left>
inoremap ` ``<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

" Allow vim to set a custom font or color for a word
syntax enable

" Set the leader button
let mapleader = ','

nnoremap <leader>b :Buffers<cr>
nnoremap <leader>m :Marks<cr>

" Autosave buffers before leaving them
autocmd BufLeave * silent! :wa

" Remove trailing white spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Center the screen quickly
nnoremap <space> zz


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

"----------------------------------------------
" Splits
"----------------------------------------------
set splitbelow
set splitright

" Creating splits
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Closing splits
nnoremap <leader>q :close<cr>

let g:NERDTreeWinPos = "right"

"----------------------------------------------
" Plugin: junegunn/fzf.vim
"----------------------------------------------
let g:fzf_layout = { 'down': '~30%' }
nnoremap <C-S-f> :FZF<cr>


"----------------------------------------------
" Plugin: Shougo/deoplete.nvim
"----------------------------------------------
if has('nvim')
	" Enable deoplete on startup
	let g:deoplete#enable_at_startup = 1
endif

" Disable deoplete when in multi cursor mode
function! Multiple_cursors_before()
	let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
	let b:deoplete_disable_auto_complete = 0
endfunction

let g:deoplete#sources#go#gocode_binary = '/home/kriyss/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['var', 'func', 'type', 'package', 'const']
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

map <C-s> :wa<cr>  " Save all on Ctrl-s

nnoremap <silent> <C-R> :Rg <C-R><C-W><CR>

"----------------------------------------------
" Language: Golang
"----------------------------------------------
" Mappings
au FileType go nmap <leader>gl	:GoMetaLinter<cr>
au FileType go nmap <leader>gc	<Plug>(go-coverage-toggle)

au Filetype go nmap <leader>gt	:GoTest<cr>
au Filetype go nmap <leader>gtf	:GoTestFunc<cr>

au Filetype go nmap <leader>ga	<Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah	<Plug>(go-alternate-split)
au Filetype go nmap <leader>gav	<Plug>(go-alternate-vertical)


au FileType go nmap <leader>gd	<Plug>(go-def)
au FileType go nmap <leader>gdv	<Plug>(go-def-vertical)
au FileType go nmap <leader>gdh	<Plug>(go-def-split)

au FileType go nmap <leader>gD	<Plug>(go-doc)
au FileType go nmap <leader>gDv	<Plug>(go-doc-vertical)

au FileType go nmap <leader>gi :GoImplements<cr>
au FileType go nmap <leader>gr :GoReferrers<cr>
au FileType go nmap <leader>gC :GoCallees<cr>

" au FileType go autocmd BufLeave * <Plug>(go-coverage-toogle)


" Set gopath and gobin
let $GOPATH=getcwd()
let $GOBIN='/home/kriyss/go/bin'

function! GoSetPwd()
	let $GOPATH='/home/kriyss/go'
endfunction

nmap <leader>gp	:call GoSetPwd()<cr>

" Use go pls
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
" Error and warning signs.

let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

let g:go_highlight_function_calls = 1
let g:go_fmt_command = "goimports"			" Run goimports when running gofmt
let g:go_echo_command_info = 1				" Show the progress when running :GoCoverage
let g:go_auto_type_info = 1					" Show type information
" let g:go_auto_sameids = 0					" Highlight variable uses
let g:go_list_type = "quickfix"				" Fix for location list when vim-go is used together with Syntastic
let g:go_test_show_name = 1					" Add the failing test name to the output of :GoTest
let g:go_addtags_transform = "camelcase"	" Set whether the JSON tags should be snakecase or camelcase.

" gometalinter configuration
let g:go_metalinter_command = "golangci-lint"
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_enabled = [
			\ 'errcheck',
			\ 'gosimple',
			\ 'golint',
			\ 'ineffassign',
			\ 'govet',
			\ 'unused',
			\ 'staticcheck',
			\ 'structcheck',
			\ 'vetshadow'
			\]


hi! def		 goCoverageCovered	  ctermfg=cyan	guibg=#485962
hi! def		 goCoverageUncover	  ctermfg=red	guibg=#8A515B
