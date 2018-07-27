""""""""""""""""""""""""
" Author: Jeromy Johnson
"
"""""""""""""""""""""""""

""Misc
set nocompatible
filetype off
set backspace=2
set mouse=a ""allow mouse usage (gets annoying sometimes..)

""Vundle
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'gmarik/Vundle.vim'

""Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
""Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
""Plugin 'troydm/easytree.vim'
Plugin 'ervandew/supertab'
Plugin 'lukaszb/vim-web-indent'
Plugin 'suan/vim-instant-markdown'
""Plugin 'jnwhiteh/vim-golang'
""Plugin 'Raimondi/delimitMate'
""Plugin 'KevinGoodsell/vim-csexact'
""Plugin 'airblade/vim-gitgutter'
Plugin 'Rip-Rip/clang_complete'
""Plugin 'Lokaltog/powerline',{'rtp': 'powerline/bindings/vim'}
Plugin 'lordm/vim-browser-reload-linux'
Plugin 'thinca/vim-visualstar'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

"" Go
au BufRead,BufNewFile *.go set filetype=go 

"""""""""""""""""""""""""
"
" > Functions
"
"""""""""""""""""""""""""

""Quick Fix Menu
command -bang -nargs=? QFix call QFixToggle(<bang>0) 
function! QFixToggle(forced) 
	if exists("g:qfix_win") && a:forced == 0 
		cclose 
		unlet g:qfix_win 
	else 
		botright cope
		let g:qfix_win = bufnr("$") 
	endif 
endfunction

"""""""""""""""""""""""""
"
" > Search Options
"
"""""""""""""""""""""""""

" Be smart about case
set smartcase

"  Highlight Search Results
set hlsearch


"" Formatting
set tabstop=4
set shiftwidth=4
set softtabstop=4

set autoindent
set smartindent



"""""""""""""""""""""""""
"
" > Tags
"
"""""""""""""""""""""""""

"" autogenerate c-tags for the given directory
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set tags+=./

"" Gotags definitions
let g:tagbar_type_go = 
	\{ 'ctagstype' : 'go',
	\ 'kinds'     : [ 'p:package', 'i:imports:1',
	\ 'c:constants', 'v:variables', 't:types',
	\ 'n:interfaces', 'w:fields', 'e:embedded',
	\ 'm:methods', 'r:constructor', 'f:functions' ],
	\ 'sro' : '.', 'kind2scope' : { 't' : 'ctype',
	\ 'n' : 'ntype' }, 'scope2kind' : {
	\ 'ctype' : 't', 'ntype' : 'n' },
	\ 'ctagsbin'  : 'gotags', 'ctagsargs' : '-sort -silent'}

"" set line numbers
set relativenumber
set cursorline
set nu

"" Ycm Config
let g:ycm_min_num_of_chars_for_completion=1

"" Supertab config
"" let g:SuperTabClosePreviewOnPopupClose=1

"" Filetype Plugins
"" TODO: move this to an autoload plugin folder
augroup go
	"" Autocorrect go declaration operator
	autocmd FileType go iab :+ :=
	autocmd FileType go set omnifunc=go#complete#Complete
	autocmd FileType go let g:SuperTabDefaultCompletionType="<c-x><c-o>"
	autocmd BufWritePre *.go GoFmt
	if has("autocmd") && exists("+omnifunc")
		filetype plugin indent on
		autocmd Filetype *
					\ if &omnifunc == "" |
					\   setlocal omnifunc=syntaxcomplete#Complete |
					\ endif
	endif
	noremap <C-]> :GoDef<CR>
augroup END


""improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

"" autocorrections for common typos
command W w
command Q q
command WQ wq
command Wq wq

"" Save and restore user defined folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview


"""""""""""""""""""""""""""""""""
"
" > Key Mappings
"
"""""""""""""""""""""""""""""""""

"" Hard Mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

inoremap <ESC> <NOP>
inoremap jk <ESC>


""My favorite key mappings
imap <C-s> <ESC>:w<CR>i
inoremap <c-o> <CR>}<ESC>O
nnoremap ; :
let mapleader = ","
map <Leader>w <C-w>w
map <Leader>q :wq<CR>
map <Leader>n :nohl<CR>
map <Leader>tt :TagbarToggle<CR>
map <Leader>tr :NERDTreeToggle<CR>
map <Leader>tg :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <Leader>p :CtrlPTag<CR>
map <Leader>qa :qall<CR>
map <Leader>a  :tabn<CR>
map \ $
map <Leader>\ ^

""open vimrc for editing
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

"" Autoindent entire file
map <Leader>kf gg=G``

"" map the spacebar to search
map <space> /

"" make shortcuts for common make labels I use
map <C-b>		:make -j 4<CR>
map <C-n>		:GoTest<CR>
map <C-i>		:GoInstall<CR>
map <Leader>mm  :w<CR>:make<CR>
map <Leader>mr  :w<CR>:make rebuild<CR>
map <Leader>mc  :w<CR>:make clean<CR>
map <Leader>md  :w<CR>:make debug<CR>

""Git shortcuts for vim fugitive
map <Leader>gs :Gstatus<CR>

""centerpunct
inoremap <Leader>. ·

"" I freaking love my quick fix list, but sometimes the commands are obnoxious
map <Leader>c :QFix<CR>
map <Leader>xc :cn<CR>
map <Leader>vc :cp<CR>

"" Replace word under cursor (so nice...)
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

"" Open remote file
map <Leader>er :e scp://

""nnoremap <F12>c :exe ':silent !google-chrome %'<CR>
""nnoremap <F12>o :exe ':silent !opera %'<CR>

let b:delimitMate_expand_cr=1

let g:syntastic_cpp_compiler_options = ' std=c++11'
let g:SuperTabDefaultCompletionType = "context"
let g:instant_markdown_autostart = 0
"""""""""""""""""""""""""""""""""
"
" > Colors And Fonts
"
"""""""""""""""""""""""""""""""""

set guioptions=aegit
""set guifont='Source Code Pro for Powerline 13'

set scrolloff=4
"" color schemes
syntax enable

set t_Co=256
"" colorscheme ir_black
colorscheme badwolf

"" set font
set gfn=Source\ Code\ Pro\ 15

"" Dont show compiled files in source tree
set wildignore=*.o,*.pdf

set encoding=utf-8

"" dont redraw screen while running macros (increases speed)
set lazyredraw

autocmd Filetype *.html syn sync fromstart
set shell=bash
