filetype indent plugin on
syntax on


set foldmethod=syntax "设置折叠方式为语法折叠
set ruler " 显示底部的行列状态栏
set spell "  鼠标置于错误单词上，按z=可显示建议拼写
set swapfile " 打开vim交换文件
set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
"set backspace=indent,eol,start whichwrap+=<,>,[,] "禁用backspace
set clipboard+=unnamed " Vim 的默认寄存器和系统剪贴板共享
set winaltkeys=no " 设置 alt 键不映射到菜单栏


set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'


colorscheme darkblue " 设置gvim主题


source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"set cursorline " 是否高亮显示光标所在行
set hlsearch " 高亮显示查询内容
set number
set lines=35 columns=100 " 窗口大小
set splitbelow " 分割出来的窗口位于当前窗口下边/右边
set splitright
set guioptions-=T " 是否包含工具栏
set guioptions-=L " 有垂直分割窗口时，左边的滚动条是否总是存在
set guioptions-=r " 右边的滚动条是否总是存在
set guioptions-=t " 包含可撕下的菜单项
set guioptions-=b " 底部(水平)滚动条是否总是存在.它的大小取决于最长的可见行
set guioptions+=g " 使不活动的菜单栏变灰，而不是完全隐藏
set guioptions-=e " 使用内置 tab 样式而不是 gui
set nolist
set guifont=Inconsolata:h12:cANSI


set autoindent
set smartindent
set tabstop=4
set expandtab
set softtabstop=4
set cin " 打开 C/C++ 风格的自动缩进。打开了自动缩进后，在编码的时候我们可以使用“V”命令选中一段文本后，按“=”将这段文本重新调整缩进格式，在一定程度上起到代码美化的作用。
set cino=:0g0t0(sus " 设定 C/C++ 风格自动缩进的选项
set ai " 打开普通文件类型的自动缩进
