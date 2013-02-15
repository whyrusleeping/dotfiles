"""""""""""""""""""""""""
" Author: Jeromy Johnson
"
"""""""""""""""""""""""""

""Misc
set nocompatible
filetype off
set backspace=2
""set mouse=a ""allow mouse usage (gets annoying sometimes..)

""Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

""Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
""Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'

""Pathogen
"" call pathogen#infect()

"" Go
set rtp+=$GOROOT/misc/vim
"" au BufRead,BufNewFile *.go set filetype=go 

"" less
au BufNewFile,BufRead *.less set filetype=less


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

let g:tagbar_type_go = {
			\ 'ctagstype' : 'go',
			\ 'kinds'     : [
			\ 'p:package',
			\ 'i:imports:1',
			\ 'c:constants',
			\ 'v:variables',
			\ 't:types',
			\ 'n:interfaces',
			\ 'w:fields',
			\ 'e:embedded',
			\ 'm:methods',
			\ 'r:constructor',
			\ 'f:functions'
			\ ],
			\ 'sro' : '.',
			\ 'kind2scope' : {
			\ 't' : 'ctype',
			\ 'n' : 'ntype'
			\ },
			\ 'scope2kind' : {
			\ 'ctype' : 't',
			\ 'ntype' : 'n'
			\ },
			\ 'ctagsbin'  : 'gotags',
			\ 'ctagsargs' : '-sort -silent'
			\ }

"" set line numbers
set nu
set cursorline

"" Ycm Config
let g:ycm_min_num_of_chars_for_completion=1

"" Filetype Plugins
autocmd FileType go set omnifunc=gocomplete#Complete
autocmd FileType go let g:SuperTabDefaultCompletionType="<c-x><c-o>"
if has("autocmd") && exists("+omnifunc")
	filetype plugin indent on
	autocmd Filetype *
				\ if &omnifunc == "" |
				\   setlocal omnifunc=syntaxcomplete#Complete |
				\ endif
endif


""improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

"" autocorrections for common typos
command W w
command Q q
command WQ wq
command Wq wq


"""""""""""""""""""""""""""""""""
"
" > Key Mappings
"
"""""""""""""""""""""""""""""""""

nnoremap ; :
let mapleader = ","
map <Leader>w <C-w>w
map <Leader>q :wq<CR>
map <Leader>n :nohl<CR>
map <Leader>tt :TagbarToggle<CR>
map <Leader>tr :NERDTreeToggle<CR>
map <Leader>qa :qall<CR>
map <Leader>a  :tabn<CR>
map \ $
map <Leader>\ ^

"" Delete current word (i know there should be a command to do this, but at
"" the time of writing i have no internet)
""map <Leader>d bvw<left>x
"" map <Leader>s bvw<left>xi

"" Autoindent entire file
map <Leader>kf ggVG=

"" map the spacebar to search
map <space> /
map <C-space> ?

"" make shortcuts for common make labels I use
map <Leader>mm :w<CR>:make<CR>
map <Leader>mr :w<CR>:make rebuild<CR>
map <Leader>mc :w<CR>:make clean<CR>
map <Leader>md :w<CR>:make debug<CR>

""Git shortcuts for vim fugitive
map <Leader>gs :Gstatus<CR>

"" cope, opens a window that displays errors
map <Leader>cc :botright cope<CR>

"" Replace word under cursor (so nice...)
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

"" Open remote file
map <Leader>er :e scp://

"""""""""""""""""""""""""""""""""
"
" > Colors And Fonts
"
"""""""""""""""""""""""""""""""""

"" set multicolor mode
"" set t_Co=256



"" color schemes
syntax enable
colorscheme ir_black
"":syn match Braces display '[{}()\[\]]'

"" set font
set gfn=Source\ Code\ Pro\ 11

"" Dont show compiled files in source tree
set wildignore=*.o,*.pdf

"" dont redraw screen while running macros (increases speed)
set lazyredraw


