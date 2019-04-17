" Welcome to your .vimrc!

" The following line turns syntax highlighting on by default.
syntax on

" This section is for installing vim plugins.
" See https://github.com/junegunn/vim-plug for more information.
call plug#begin('~/.vim/plugged-ins')

Plug 'reedes/vim-pencil'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-system-copy'
Plug 'mattn/vim-starwars'

call plug#end()

" This section configures the Pencil plugin.
" See https://github.com/reedes/vim-pencil for more information.
set nocompatible
filetype plugin on

" Set the default wrap mode to soft, as in MS Word.
let g:pencil#wrapModeDefault = 'soft' 

"Turn on the Pencil plugin for certain files
augroup pencil
	autocmd!
	autocmd FileType markdown,mkd 	call pencil#init()
	autocmd FileType text		call pencil#init()
augroup END

" Turn on line numbers
set number

" Allow backspace over specified text objects
set backspace=indent,eol,start 

" Runs command-line command "setlocal spell spelllang=en_us"
" for all text files i.e. turns on vim's built-in spellcheck.
autocmd FileType text setlocal spell spelllang=en_us
