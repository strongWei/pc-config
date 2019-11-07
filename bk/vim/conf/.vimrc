" vim config file
" @author strong
" @email 1025155365@qq.com

" --------------------------------------
" ------ Vundle Required ---------------
" 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" php completer
"Plugin 'shawncplus/phpcomplete.vim'

" taglist
Plugin 'taglist.vim'

" nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" php-namespace
Plugin 'arnaud-lb/vim-php-namespace'

" ctrlp
Plugin 'ctrlpvim/ctrlp.vim'

" deopplete: other complete
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'shougo/deoplete.nvim'
" python complete
Plugin 'deoplete-plugins/deoplete-jedi'
" php complete: bug!!
"Plugin 'lvht/phpcd.vim'
Plugin 'padawan-php/deoplete-padawan'

" git wrapper
Plugin 'tpope/vim-fugitive'

" syntastic
Plugin 'vim-syntastic/syntastic'

" color theme
Plugin 'christophermca/meta5' 

call vundle#end()            " required
filetype plugin indent on    " required
" 
" ------ Vundle End      ---------------
" --------------------------------------

set expandtab      "空格代替制表符
set tabstop=4      "4个空格
set shiftwidth=4   "Normal下, '<<' 或 '>>' 移动多少个空格 ?
set nu
let mapleader=','
set mouse=n
inoremap jj <ESC>

set completeopt=longest,menuone "omid 自动补全窗口设置
set tags+=tags.vendor
"自动更新taglist
let Tlist_Auto_Update=1
"设置taglist宽度
let Tlist_WinWidth=40
"因为我们放在环境变量里，所以可以直接执行
let Tlist_Ctags_Cmd='ctags'
"让窗口显示在右边，0的话就是显示在左边
let Tlist_Use_Right_Window=1
"让taglist可以同时展示多个文件的函数列表
let Tlist_Show_One_File=0
"非当前文件，函数列表折叠隐藏
let Tlist_File_Fold_Auto_Close=1
 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Exit_OnlyWindow=1
"为1则即使标签列表窗口未打开，taglist仍然会在后台处理vim所打开文件的标签
let Tlist_Process_File_Always=1
let Tlist_Inc_Winwidth=0


" --------------------------------------
" ------ Deoplete Required ---------------
" 
" startup deoplete
let g:deoplete#enable_at_startup = 1
" pcd config bug!!
"let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
"let g:deoplete#ignore_sources.php = ['omni']
" 
" ------ Deoplete End      ---------------
" --------------------------------------

" --------------------------------------
" ------ Ctrlp Required ---------------
" 
nnoremap <Leader>f :CtrlP <CR>
nnoremap <Leader>fb :CtrlPBuffer <CR>
" 
" ------ Ctrlp End      ---------------
" --------------------------------------

" --------------------------------------
" ------ Syntastic Required ---------------
" 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" 
" ------ Syntastic End      ---------------
" --------------------------------------

" --------------------------------------
" ------ NerdTree Required ---------------
" 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 只剩下最后一个窗口时关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '|'
map <silent> <F7> :NERDTreeToggle<CR>

" NERDTress File highlighting
function NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'gray', 'none', 'gray', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'gray', 'none', 'gray', '#151515')
call NERDTreeHighlightFile('config', 'gray', 'none', 'gray','#151515')
call NERDTreeHighlightFile('conf', 'gray', 'none', 'gray', '#151515')
call NERDTreeHighlightFile('json', 'gray', 'none', 'gray', '#151515')
call NERDTreeHighlightFile('html', 'gray', 'none', 'gray', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff','#151515')
" 
" ------ NerdTree End      ---------------
" --------------------------------------

" --------------------------------------
" ------ PHP Required ---------------
" 

autocmd FileType php call s:php_env_init()

function s:php_env_init()
    " 用缩进来定义折叠
    set foldmethod=indent
    " 启动vim时不要自动折叠代码
    set foldlevel=1 
    " 设置折叠栏宽度
    set foldcolumn=5   

    call s:key_map()

    "call s:taglist_env_init()
    call s:syntastic_env_init()
endfunction

function s:key_map()
    " php-complete
    " inoremap <Leader>/ : <C-x><C-o>

    " taglist
    nnoremap <silent> <F8> :TlistToggle<CR>

    " vim-php-namespace
    noremap <Leader>u :call PhpInsertUse()<CR>
    noremap <Leader>e :call PhpExpandClass()<CR>
endfunction

function s:syntastic_env_init()
    let g:syntastic_php_checkers = ['php']
endfunction

function s:taglist_env_init()
    set tags+=tags.vendor
    autocmd BufWritePost *.php silent execute "!ctags" 
endfunction

"
" - ------ PHP End      ---------------
" --------------------------------------

" --------------------------------------
" ------ YML Required ---------------
" 
autocmd FileType yml call s:yml_env_init()
function s:yml_env_init()
    set tabstop=2      "4个空格
    set shiftwidth=   "Normal下, '<<' 或 '>>' 移动多少个空格 ?
endfunction
"
" ------- YML End      ---------------
" --------------------------------------
