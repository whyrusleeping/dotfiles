set tabstop=4
set shiftwidth=4
" autocmd VimEnter * NERDTree

set tags+=./

"" autogenerate c-tags for the given directory
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

if has("autocmd")
	filetype plugin indent on
endif

"" autocorrections for common typos
command W w
command Q q
command WQ wq
command Wq wq

"" shortcuts!
let mapleader = ","
map <Leader>w <C-w>w
map <Leader>n :nohl<CR>
map <Leader>q :wq<CR>
map <Leader>n :nohl<CR>
map <Leader>m :w<CR>:make<CR>
map <Leader>tt :TagbarToggle<CR>
map <Leader>tr :NERDTreeToggle<CR>
map <Leader>tq :qall<CR>
"" color schemes
colorscheme ir_black
