set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'SirVer/ultisnips'

Plugin 'honza/vim-snippets'
Plugin 'Shougo/neopairs.vim'

"Plugin 'stamblerre/gocode', {'rtp': 'vim/'}

call vundle#end()

let g:neopairs#enable = 1
let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_smart_case = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

filetype on
syntax on
syntax enable
colorscheme badwolf
hi Comment cterm=italic
set background=dark
highlight LineNr ctermfg=grey
hi MatchParen ctermfg=white
hi MatchParen ctermbg=black

"let g:go_def_mode='godef'

let mapleader = ","

call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])

call deoplete#custom#var('omni', 'input_patterns', {
   		\        'go': '[^. *\t]\.\w*',
   		\})

"let g:SuperTabDefaultCompletionType = "<c-n>"
"" Go
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

let g:go_snippet_engine = "ultisnips"
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1

let g:go_auto_type_info = 0

let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_info_mode = "gopls"
let g:go_def_mode = "gopls"

map <C-n>		:GoTest<CR>
noremap <C-i> :GoInstall<CR>
noremap <C-]> :GoDef<CR>
map <Leader>f :GoFillStruct<CR>
map <Leader>e oif err != nil {<CR>

""improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

"" dont redraw screen while running macros (increases speed)
set lazyredraw

"" set font
set gfn=Source\ Code\ Pro\ 15

set guioptions=aegit


set clipboard=unnamedplus
set mouse=r
set hlsearch
set autoindent
set smartindent
set smartcase
set relativenumber
set cursorline
set nu
set incsearch
set colorcolumn=80

set undofile
set undodir=$HOME/.nvim/undo
set undolevels=1000
set undoreload=1000
set scrolloff=5

"set list
"set listchars=
"set listchars+=tab:→\ 
"set listchars+=trail:·
"set listchars+=extends:»              " show cut off when nowrap
"set listchars+=precedes:«
"set listchars+=nbsp:⣿

set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab


command! W w
command! Q q
command! Wq wq
nnoremap ; :

inoremap jk <ESC>

" so your not lazy
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>
" inoremap <Up> <NOP>
" inoremap <Down> <NOP>
" inoremap <Left> <NOP>
" inoremap <Right> <NOP>

" i3 like movement
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>


map <Leader>t :TagbarToggle<CR>
map <Leader>p :CtrlP<CR>
map <Leader>w <C-w>w
map <Leader>q :wq<CR>
map <Leader>n :nohl<CR>
"
"" Configure Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <Tab> <Plug>AirlineSelectNextTab
nmap <S-Tab> <Plug>AirlineSelectPrevTab

" vim go colors
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_array_whitespace_error = 1


set dictionary+=/usr/share/dict/words
