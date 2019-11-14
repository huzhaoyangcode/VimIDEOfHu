let mapleader = ","           " This is my mapleader
set nocompatible              " be iMproved, required
filetype off                  " Vundle required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'derekwyatt/vim-protodef'
Plugin 'kshenoy/vim-signature'
Plugin 'majutsushi/tagbar'
Plugin 'dyng/ctrlsf.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'Lokaltog/vim-easymotion'
 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " Vundle required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式,即不和vim兼容，使用vim的内部命令
set nocompatible
" 总是显示状态栏,2代表把状态行放在下面的倒数第二行，0代表移除状态行
set laststatus=0
" 显示光标当前位置
set ruler
" 禁止折行
set nowrap
" 开启行号显示
set number
" 高亮显示当前行/列
" set cursorline
" set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 设置状态栏主题风格
" let g:Powerline_colorscheme='solarized256'
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" C++语法高亮
syntax keyword cppSTLtype initializer_list
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>
"vim-signature 快捷键如下：
" m+alpha建立书签。
" `+alpha跳到对应书签。
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=0 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>tt :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
" 此插件基于ack-grep, 不使用光标时候是: CtrlSF func
nnoremap <Leader>sp :CtrlSF<CR> 
"自动注释插件快捷键
"<leader>cc 注释
"<leader>cu 取消注释
"设置查看本文件的快捷键
nnorema <Leader>ii :e ~/.vimrc<CR>

"代码模板补全
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

"接口快速生成实现
" 设置 pullproto.pl 脚本路径
let g:protodefprotogetter='~/.vim/bundle/vim-protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1

" 启用:Man命令查看各类man信息
source $VIMRUNTIME/ftplugin/man.vim
" 定义:Man命令查看各类man信息的快捷键
nmap <Leader>man :Man 3 <cword><CR>

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
map <Leader>bn :MBEbn<cr>
map <Leader>bp :MBEbp<cr>

"复制和粘贴到外面，需要下载sudo apt-get install xclip
vmap <Leader><Leader>y :!xclip -f -sel clip<CR>
map <Leader><Leader>p :r!xclip -o<CR>
"格式化代码
nmap <leader>z2 <ESC>:set equalprg=astyle\ --style=linux\ -s4\ \ -m3\ -k3\ -p\ -j\ -H\ -U\ -S\ -c\ -w\ -Y\ -xe\ -xy\ -L\ -xC80\ --mode=c<CR>
nmap <leader>z1 <ESC>:set equalprg=<CR>
