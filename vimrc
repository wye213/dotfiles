"自己定义vimrc常见设置和一些键位的设置

"---------------- 加载插件管理文件 --------------------
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

"--------------- leader设定 -------------
let mapleader = ','
let g:mapleader = ','

"------------------------------- 基本设置 -----------------------------------

"开启语法高亮
"syntax enable 该命令只在当前文件有效
syntax on " 在所有缓冲区文件都有效

"-------------- 文件检测 ----------------------
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

colorscheme molokai          " 配色主题

set autoread                 " 文件修改之后自动载入。
set shortmess=atI            " 启动的时候不显示那个援助索马里儿童的提示

set laststatus=2
set confirm                  " 取消光标闪烁
set noswapfile               " 关闭交换文件

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

set cursorcolumn             " 突出显示当前列
set cursorline               " 突出显示当前行

set title 
set novisualbell
set noerrorbells

set ruler
set number
set nowrap

set showcmd
set showmode                 " 显示vim模式

set showmatch                " 括号匹配，高亮
set matchtime=1         

set hlsearch                 " 高亮搜索的文本
set incsearch                " 即时搜索
set ignorecase               " 搜索忽略大小写
set smartcase                " 有一个或以上大写字母时仍大小敏感

set foldenable               " 代码折叠
set foldmethod=manual
set foldlevel=99             

set smartindent              " 智能缩进
set autoindent               " 自动缩进

"------------------------------- tab 相关设置 ---------------------
set tabstop=4                " 设置tab的宽度
set shiftwidth=4             " 每一次缩进对应的空格数
set softtabstop=4            " 按退格键是可以一次删除4个空格
set smarttab                 
set expandtab                " 将tab自动转化为空格
set shiftround               " 缩进时，取整

"------------------------------- 文件编码 -------------------------
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbkgb2312,cp936 " 自动判断编码
set helplang=cn
set ffs=unix,mac,dos

set formatoptions+=B          " 合并两行中文时，不在中间加空格
set termencoding=utf-8        " 终端编码

"------------------------------- 其他设置 -------------------------
set completeopt=longest,menu
set wildmenu
set wildignore=*.0,*~,*.pyc,*.class

"------------------------------- 自定义快捷键设置 -----------------

" 关闭方向键，使用hjkl
map <Left> <Nop>             
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop> 

" 行首 和 行尾 map
noremap H ^
noremap L $

" 命令模式map 
noremap ; :

" 插入模式下 kj 带起 Esc
inoremap kj <Esc>       

" 分屏切换
noremap w<up> <c-w><up>
noremap wk <c-w><up>
noremap w<left> <c-w><left>
noremap wh <c-w><left>
noremap w<right> <c-w><right>
noremap wl <c-w><right>
noremap w<down> <c-w><down>
noremap wj <c-w><down>

" 补全括号 
"inoremap ( ()<LEFT>
"inoremap [ []<LEFT>
"inoremap { {}<LEFT>
"inoremap ' ''<LEFT>
"inoremap ` ``<LEFT>


" 插件命令
:command NT :NERDTreeToggle
:command TG :TlistToggle




" ----------------------- 插件设置 ------------------------------

" NERDTree 插件设置
""autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowLineNumbers=1
let NERDTreeIgnore=['\.pyc$', '\~$']

" taglist 插件设置
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Auto_Open=0
let Tlist_Auto_Highlight_Tag=1
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=35

" 自动补全引号等插件设置
au FileType python let b:delimitMate_nesting_quotes = ['"']

let g:NERDTreeMapOpenSplit = 's'   
let g:NERDTreeMapOpenVSplit = 'v'


" python 相关语法检查
let g:pyflakes_use_quickfix = 0
let python_highlight_all = 1

" markdown 插件设置
let g:vim_markdown_folding_disable = 1

" 多光标选中编辑设置
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" 快速注释
let g:NERDSpaceDelims = 1

" 文件搜索插件
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f : CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \}

let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" ctrlp相关插件 函数搜索
nnoremap <Leader>fu: CtrlPFunky<Cr>
nnoremap <Leader>fU:execute 'CtrlpFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']
