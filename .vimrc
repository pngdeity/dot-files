" Welcome to your .vimrc!

" The following line turns syntax highlighting on by default.
syntax on

" This section is for installing vim plugins.
" See https://github.com/junegunn/vim-plug for more information.
call plug#begin('~/.vim/plugged-ins')

Plug 'reedes/vim-pencil'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-system-copy'

call plug#end()

" This section sets the Pencil plugin automatically for some
" filetypes.
" See https://github.com/reedes/vim-pencil for more information.
set nocompatible
filetype plugin on

let g:pencil#wrapModeDefault = 'soft' 

augroup pencil
	autocmd!
	autocmd FileType markdown,mkd 	call pencil#init()
	autocmd FileType text		call pencil#init()
augroup END
