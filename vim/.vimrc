set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Emeet-vim
Plugin 'mattn/emmet-vim'

call vundle#end()            " required
filetype plugin indent on    " required

" Plugin Emmet-vim config
let g:user_emmet_install_global = 0
" also support JSX
autocmd FileType html,css,javascript EmmetInstall
