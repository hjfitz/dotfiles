" general settings
set nocompatible
"set cursorline
set nu
"custom
syntax on
colorscheme solarized
filetype plugin indent on

" plugin manager settings
execute pathogen#infect()
let g:airline_powerline_fonts = 1
" remaps
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <F3> :NumbersToggle<CR> 
