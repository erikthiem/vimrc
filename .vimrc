set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set number            " Set line numbering by default

" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

" Ctrl-P file fuzzy search
set runtimepath^=~/.vim/bundle/*
let g:ctrlp_custom_ignore = '^vendor\/bundle*'

" Text search across files
let g:ackprg = 'ag --nogroup --nocolor --column'

" Set line length warning bar
set colorcolumn=100

" Navigate tabs with control-l, control-h
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>

" Set leader key to ,
let mapleader=","

map <Leader>w :w<Enter>
map <Leader>q :q<Enter>

" Rename current file
function! RenameFile()
 let old_name = expand('%')
 let new_name = input('New file name: ', expand('%'))
 if new_name != '' && new_name != old_name
	 exec ':saveas ' . new_name
	 exec ':silent !rm ' . old_name
	 redraw!
 endif
endfunction
map <leader>n :call RenameFile()<cr>
let g:ctrlp_custom_ignore = '^vendor\/bundle*'

" splitjoin
map <Leader>s :SplitjoinSplit<Enter>
map <Leader>j :SplitjoinJoin<Enter>

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'elmcast/elm-vim'
call plug#end()
