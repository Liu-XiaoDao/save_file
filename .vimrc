filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'scrooloose/nerdcommenter'
Bundle 'godlygeek/tabular'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'Yggdroot/indentLine'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'neoclide/coc.nvim', {'branch': 'release'}
Bundle 'jiangmiao/auto-pairs'
Bundle 'morhetz/gruvbox'
Bundle 'mhinz/vim-startify'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/mru.vim'
filetype plugin indent on

" 插件管理
" 树形菜单
" 状态栏
" Ctrlp 快速文件搜索
" tagbar
" 显示行尾无用空格
" 快速移动
" 宏定义提示
" 语法块吧
" 快速注释
"
"
" 缩进线
" YouCompleteMe 代码提示
" coc.nvim 代码提示
" 代码提示
" 括号自动补全
" 主题
" 启动画面
" git显示哪行修改过
" 使用Gstatus/Gblame等
" 显示最近打开过的文件


" 基础设置
set nu " 设置行号
set ts=2 " tab空格
set expandtab
set autoindent
set hlsearch " 高亮搜索
let mapleader=','
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>
inoremap jj <Esc> " `^
cnoremap w!! w !sudo tee % >/dev/null

" 光标所在的行列
"set cursorcolumn  "or set cuc 设置光标所在的列
set cursorline    "or set cul 设置光标所在的行

"窗口切换配置
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" 打开python文件自动加上文件头
func SetTitle()
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call setline(2, "\# -*- coding:utf-8 -*-")
        normal G
        normal o
        normal o
        call setline(5, "if __name__ == '__main__'")
        call setline(6, "    pass")
    endif
endfunc


" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
" autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F5> :NERDTreeToggle<cr>
nnoremap <leader>v :NERDTreeFind<cr> "查找文件位置


" vim-powerline配置
set laststatus=2
set t_Co=256
let g:Powerline_symbols='unicode'
let g:Powerline_branch=1


" ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1


" tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
" 启动时自动focus
let g:tagbar_autofocus = 1
" for ruby, delete if you do not need
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }


" 标记行尾无效空格
map <leader><space> :FixWhitespace<cr>   " 去掉末尾空格


" 快速移动
nmap ss <Plug>(easymotion-s2)


" 宏定义补全 ultisnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsUsePythonVersion = 3



" 快速注释
let NERDSpaceDelims = 1


" 代码对齐
" \bb                 按=号对齐代码 [Tabular插件]
nmap <leader>bb :Tab /=<CR>
" \bn                 自定义对齐    [Tabular插件]
nmap <leader>bn :Tab /


" YouCompleteMe
"set runtimepath+=~/.vim/bundle/YouCompleteMe
"let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
"let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
"let g:syntastic_ignore_files=[".*\.py$"]
"let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
"let g:ycm_complete_in_comments = 1
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
"let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
"let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
"let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|     " 跳转到定义处
"let g:ycm_min_num_of_chars_for_completion=2                "从第2个键入字符就开始罗列匹配项

"----------YouCompleteMe configuration---
"set runtimepath+=~/.vim/bundle/YouCompleteMe "使用插件
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py' "指定全局配置文件路径
"set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
"回车即选中当前项
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"上下左右键的行为
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>":
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
"let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
"let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
"let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
"let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>"force recomile with syntastic
"inoremap <leader><leader> <C-x><C-o>
"let g:ycm_complete_in_comments = 1 "在注释输入中也能补全
"let g:ycm_complete_in_strings = 1 "在字符串输入中也能补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 1 "注释和字符串中的文字也会被收入补全
"let g:clang_user_options='|| exit 0'
"let g:ycm_goto_buffer_command = 'horizontal-split' "跳转到定义处，分屏打开
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
"let g:ycm_error_symbol = '>>' "错误提示符
"let g:ycm_warning_symbol = '>*' "警告提示符



" Yggdroot/indentLine 代码对齐线
let g:indentLine_char = '¦'
let g:indentLine_color_term = 239
"映射到ctrl+i键
map <C-i> :IndentLinesToggle<CR>

" gruvbox主题
set bg=dark "设置背景为黑色
colorschem gruvbox "设置主题为 gruvbox
set guioptions= "去掉两边的scrollbar
set guifont=Monaco:h17 "设置字体和字的大小

" 显示最近打开过的文件
nmap <F3> :MRU<cr>
