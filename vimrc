"""""""""""""""""""""""""
" Author: Jeromy Johnson
"
"""""""""""""""""""""""""


"""""""""""""""""""""""""
"
" > Search Options
"
"""""""""""""""""""""""""

" Be smart about case
set smartcase

"  Highlight Search Results
set hlsearch

set tabstop=4
set shiftwidth=4

"""""""""""""""""""""""""
"
" > Tags
"
"""""""""""""""""""""""""

"" autogenerate c-tags for the given directory
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set tags+=./

"" set line numbers
set nu
set cursorline

"" Filetype Plugins
if has("autocmd")
	filetype plugin indent on
endif

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

"" cope
map <Leader>cc :botright cope<CR>


"""""""""""""""""""""""""""""""""
"
" > Colors And Fonts
"
"""""""""""""""""""""""""""""""""

"" set multicolor mode
set t_Co=256

"" color schemes
syntax enable
colorscheme ir_black
"" set font
set gfn=Source\ Code\ Pro\ 11

"" Dont show compiled files in source tree
set wildignore=*.o,*.pdf
