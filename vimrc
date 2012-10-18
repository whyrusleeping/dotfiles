set tabstop=4
set shiftwidth=4
" autocmd VimEnter * NERDTree

set tags+=./

map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"" nmap <F8> :TlistToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :NERDTreeToggle<CR> 
if has("autocmd")
	filetype plugin indent on
endif

command W w
command Q q
command WQ wq
command Wq wq

let mapleader = ","
map <Leader>w <C-w>w
map <Leader>n :nohl<CR>
