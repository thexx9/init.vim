:set number
:set relativenumber
:set mouse=a
:set number " 显示行号
    " 使用:set number?可以显示当前值
:set ruler " 显示光标位置
:set showcmd " 右下角显示命令
:set nocompatible  " 去掉有关vi一致性模式,避免操作习惯上的局限.
:set scrolloff=5
:set laststatus=2   " 1=启动显示状态行, 2=总是显示状态行
:set wildmenu  " 使用Tab键补全时,在状态栏显示匹配的列表
:set showmatch  " 高亮显示匹配的括号
:set hlsearch                        " 高亮匹配结果
:set ignorecase                      " 搜索时默认忽略大小写
:set smartcase                       " 搜索时智能匹配大小写
:syntax enable  " 开启语法高亮
:set shiftwidth=4 " 自动缩进时,缩进长度为4 
:set encoding=utf-8  
:set cursorline   " 突出显示当前行
:set mouse=a 
:set tabstop=4  " 设置 Tab 键宽度为 4 个空格
:" 禁用交换文件
:set noswapfile
:" 禁用undo文件
:set noundofile
:"Vim自动探测fileencodings的顺序列表
:"启动时会按照它所列出的字符编码方式逐一探测即将打开的文件的字符编码方式
:"并且将fileencoding设置为最终探测到的字符编码方式
:set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
:set termencoding=utf-8              " Vim所工作的终端的字符编码方式
:set autoindent                      " 自动缩进
:set autoread                        " 文件变化之后自动重读
:" 打开文件时光标返回上次离开的位置
:autocmd BufReadPost * execute "normal g'\""
:
:" ===
:" === Basic Mappings
:" ===
:let mapleader=" "
:noremap Q :q<CR>
:noremap S :w<CR>
:noremap ; :
:" Open the vimrc file anytime
:noremap <LEADER>rc :e C:/Users/thexx/AppData/Local/nvim/init.vim<CR>
:" paste
:nnoremap P "+p
:" make Y to copy till the end of the line
:nnoremap Y y$
:" Copy to system clipboard
:vnoremap Y "+y
:" Search
:noremap <LEADER><CR> :nohlsearch<CR>
:" 9 key: go to the end of the line
:noremap <silent> 9 $
:" K/J keys for 5 times k/j (faster navigation)
:noremap <silent> K 5k
:noremap <silent> J 5j
:map <C-a> ggVG
: " Use <space> + arrow keys for moving the cursor around windows
:noremap <LEADER>k <C-w>k
:noremap <LEADER>j <C-w>j
:noremap <LEADER>h <C-w>h
:noremap <LEADER>l <C-w>l
:noremap qf <C-w>o
:" Disable the default s key
:noremap s <nop>
:map sl :set splitright<CR>:vsplit<CR>
:map sh :set nosplitright<CR>:vsplit<CR>
:map sj :set splitbelow<CR>:split<CR>
:map sk :set nosplitbelow<CR>:split<CR>
:" Resize splits with arrow keys
:noremap <up> :res +5<CR>
:noremap <down> :res -5<CR>
:noremap <left> :vertical resize-5<CR>
:noremap <right> :vertical resize+5<CR>
:" make new tanline
:map tu :tabe<CR>
:map tn :+tabnext<CR>
:map tp :-tabnext<CR>

set shortmess=a
set cmdheight=2
syntax on

"=== Plug ==="
call plug#begin()
Plug 'mhinz/vim-startify'
Plug 'arzg/vim-colors-xcode'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'drinks5/nvim-yapf-formater'
call plug#end()

"===rainbow==="
let g:rainbow_active = 1

"===indentLine==="
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

"===coc-config==="
set hidden
set signcolumn=number
set shortmess+=c
set updatetime=100

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-r> coc#refresh()

nmap <silent>- <Plug>(coc-diagnostic-prev)
nmap <silent>= <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <<silent> <LEADER>f :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

"===vim-startify==="
 let g:startify_custom_header          = [
	\'',
 	\'',
 	\'████████╗██╗  ██╗███████╗██╗  ██╗██╗  ██╗',
	\'╚══██╔══╝██║  ██║██╔════╝╚██╗██╔╝╚██╗██╔╝',
	\'   ██║   ███████║█████╗   ╚███╔╝  ╚███╔╝ ',
	\'   ██║   ██╔══██║██╔══╝   ██╔██╗  ██╔██╗ ',
   	\'   ██║   ██║  ██║███████╗██╔╝ ██╗██╔╝ ██╗',
   	\'   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝',
 	\]
 nmap = <silent>~ :Startify<CR>

 "===编译设置==="
 "新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"thexx") 
		call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"# thexx")
        call append(line("."),"# coding=utf-8")
	    call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
	    call append(line(".")+1, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: thexx") 
		call append(line(".")+2, "	> Mail: ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if expand("%:e") == 'cpp'
		call append(line(".")+6, "#include<bits/stdc++.h>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+8, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
	endif
	"新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G

map <C-n> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		:sp
		:term %<
	elseif &filetype == 'cpp'
		exec "!g++ -std=c++17 -Wall % -o %<"
		:sp
		:term %<
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"
		:sp
    	:res -5
		:term %<
	elseif &filetype == 'sh'
		:!./%
	elseif &filetype == 'python'
		:sp
		:res -5
		:term %<
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc
"===nerdtree==="
"autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore = ['.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers=0 " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
""Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <F3> :NERDTreeToggle<CR> " 开启/关闭nerdtree快捷键

