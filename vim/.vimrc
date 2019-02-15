set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Emeet-vim
Plugin 'mattn/emmet-vim'

" instant markdown
Plugin 'suan/vim-instant-markdown'

" syntastic
Plugin 'vim-syntastic/syntastic'

" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" Nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" taglist
Plugin 'taglist.vim'

" git
" Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'

" ctrlp
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" basic
set nu


" - status
set laststatus=2
highlight StatusLine cterm=bold ctermfg=black ctermbg=green
" 获取当前路径，将$HOME转化为~
func! CurDir()
  let curdir = substitute(getcwd(), $HOME, "~", "g")
  return curdir
endfun
set statusline=%{FugitiveStatusline()}[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "显示文件名：总行数，总的字符数

" - indent 
" `smartindent` `autoindent`的升级版，遇到 `}` 取消缩进, 某行以 `#` 开头，则不会使用该规则
" `cindent` 使用c语言的标准缩进方式
" `autoindent` 新增加的一行与前一行有相同的缩进
set smartindent 
set expandtab   " 由空格代替制表符，`tabstop`定义几个空格
set tabstop=4	
set shiftwidth=4 " Normal下，`<<`或`>>' 移动多少个空格

" - omnifunc complete
inoremap <C-x> <C-X><C-O>

" - esc
inoremap jk <ESC>
		
" - \
let mapleader=','
nnoremap <leader>c :wqa<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>> <C-w>5>
nnoremap <leader>< <C-w>5<
nnoremap <leader>+ <C-w>5+
nnoremap <leader>- <C-w>5-
nnoremap <leader>f :CtrlP


" emmet configure
let g:user_emmet_install_global = 0
let g:user_emmet_mode='i' 
" add JSX support
autocmd FileType html,css,less,javascript,php EmmetInstall

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" - js
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_html_checkers = ['stylelint']
let g:syntastic_css_checkers = ['stylelint']
let g:syntastic_less_checkers = ['stylelint']


" - py
let g:syntastic_python_checkers = ['python']
let g:syntastic_python_python_exec = '/usr/bin/python3'
" - c++
" let g:syntastic_cpp_checkers = ['gcc']
" let g:syntastic_cpp_compiler = 'gcc'
" let g:syntastic_cpp_compiler_options = '-std=c++11'

" youcompleteme
" - basic setting
let g:ycm_autoclose_preview_window_after_completion = 1
" - ignore filetype
" let g:ycm_filetype_specific_completion_to_disable = {
"	\ 'cpp': 1
"	\}
" - c++ complete config 
let g:ycm_global_ycm_extra_conf = '~/.vim/config/ycm_global_ycm_extra_conf'

" - php complete config
" autocmd FileType php inoremap <C-L> <C-X><C-O>

" YouCompleteMe
" - subcommand
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>


" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" taglist
" - 自动更新
let Tlist_Auto_Update=1
" - 宽度
let Tlist_Width=40
" - 是否显示在右边
let Tlist_Use_Right_Window=1
" - 是否显示多个文件的函数列表, 0表示是
let Tlist_Show_One_File=1
" - 非当前文件，列表函数自动隐藏
let Tlist_File_Fold_Auto_Close=1 
" - 最后一个窗口是taglist, 自动退出vim
let Tlist_Exit_OnlyWindow=1
" - 即使窗口未打开，仍在后台处理
let Tlist_Process_File_Always=1

" git: fugitive
"
"" YouCompleteMe

" css/less setting
" YouCompleteMe
autocmd FileType css,less call ConfigCss()
fun ConfigCss()
  set omnifunc=csscomplete#CompleteCSS 
endfun

" yaml setting
autocmd FileType yaml call ConfigYaml()
fun ConfigYaml()
  set autoindent
endfun

" - recoginze file extends .ts
autocmd BufNewFile,BufRead *.tsx call ConfigTSX()
fun ConfigTSX()
  setf javascript
endfun 

autocmd FileType css,less,sh,yaml,javascript call ConfigTab()
fun ConfigTab()
  set tabstop=2
  set shiftwidth=2
endfun
