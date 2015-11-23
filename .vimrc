"""""""""" mini buffer navigator"""""""""""
let g:miniBUfExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1 
let g:miniBufExplUseSingleClick=1

""""""""""""ctags settings"""""""""""""""""
"注意=后不可有空格"
set tags+=/home/lincolnlin/.vim/tag/mmbiz
set tags+=/home/lincolnlin/.vim/tag/stl
set tags+=~/QQMail/mm3rd/boost/tags

""""""""""color scheme""""""""""""""""""""
let g:rehash256 = 1
set t_Co=256
set background=dark
"colorscheme desert
"colorscheme solarized
colorscheme molokai 
"colorscheme koehler
"colorscheme darkburn
"colorscheme tir_black
"let g:molokai_original = 1


""""""""""""vundle"""""""""""""""""""""""""
set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

""""""""vim scripts""""""""""""""""""
Bundle 'c.vim'
"Bundle 'minibufexpl.vim'
Bundle 'grep.vim'
Bundle 'mru.vim'
Bundle 'comments.vim'
Bundle 'STL-Syntax'
Bundle 'AutoClose'
Bundle 'a.vim'
Bundle "TaskList.vim"
Bundle "vim-easy-align"
Bundle "cppSyntaxCheck"

"if no YouCompleteMe
Bundle 'neocomplcache'
Bundle 'OmniCppComplete'

""""""""git repo"""""""""""""""
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
"Bundle 'SirVer/ultisnips' 
"Bundle 'honza/vim-snippets'
Bundle 'kevinw/pyflakes-vim'
Bundle 'fencview.vim'

Bundle "Shougo/vimproc.vim"
Bundle "Shougo/vimshell.vim"
Bundle "rainbow_parentheses.vim"
Bundle "Yggdroot/indentLine"
Bundle "altercation/vim-colors-solarized"
"Bundle 'Lokaltog/vim-easymotion'
Bundle "mbbill/undotree"
Bundle "kien/ctrlp.vim"
Bundle "Chiel92/vim-autoformat"
Bundle "FuDesign2008/randomColor.vim"


""""""""full path"""""""""""""""
Bundle 'git://github.com/nathanaelkane/vim-indent-guides.git'
"Bundle 'Valloric/YouCompleteMe'

Plugin 'flazz/vim-colorschemes'

""""""""""syntastic""""""""""""
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'

"set error or warning signs
let g:syntastic_error_symbol = '>>'
let g:syntastic_warning_symbol = '>*'
"whether to show balloons
let g:syntastic_enable_balloons = 1
let g:syntastic_python_checkers=['pyflakes']

""""""""""""YCM""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 菜单
""highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" " 选中项
""highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" " 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" " 引入 C++ 标准库tags
set tags+=/data/misc/software/misc./vim/stdcpp.tags
" " YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" " 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" " 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" " 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" " 语法关键字补全            
let g:ycm_seed_identifiers_with_syntax=1"

filetype plugin indent on     " required!"
syntax on

"-----------------------
" search 
"-----------------------
set ignorecase "大小写无关
set hlsearch "高亮显示结果
set incsearch "在输入要搜索的文字时，vim会实时匹配

"不要闪烁
set novisualbell

"=>编码
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""R
"环境变量 LANG（使用的语言）；
"环境变量 LC_CTYPE（使用的内部编码）；
"Vim 选项 encoding（Vim 的内部编码）；
"Vim 选项 termencoding（Vim 在与屏幕/键盘交互时使用的编码）；
"Vim 选项 fileencoding（Vim 当前编辑的文件在存储时的编码）；
"Vim 选项 fileencodings（Vim 打开文件时的尝试使用的编码）；
set encoding=utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
set ambiwidth=double

"=>在Vim中执行一些过滤操作需要知道一些shell的有关情况
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shell=bash

"设置快速编辑.vimrc文件 ,e 编辑.vimrc    保存.vimrc文件后会自动调用新的.vimrc 
noremap <silent> <leader>e :call SwitchToBuf($MYVIMRC)<cr> 
autocmd! bufwritepost *vimrc* source $MYVIMRC 

"定义 "mapleader"变量
let mapleader = ","
let g:mapleader = ","

"=>Text option
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4	"(自动) 缩进每一步使用的空白数目.用于 "cindent", ">>", "<<" 等.
set softtabstop=4
set tabstop=4
set smarttab


"SwitchToBuf()实现它在所有标签页的窗口中查找指定的文件名,如果找到这样一个窗口,
"就跳到此窗口中；否则，它新建一个标签页来打开vimrc文件 
"上面自动编辑.vimrc文件用到的函数 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
function! SwitchToBuf(filename) 
    let bufwinnr = bufwinnr(a:filename) 
    if bufwinnr != -1 
        exec bufwinnr . " wincmd w" 
        return 
    else 
        " find in each tab 
        tabfirst 
        let tab = 1 	
        while tab <= tabpagenr("$") 
            let bufwinnr = bufwinnr(a:filename) 
            if bufwinnr != -1 
                exec "normal " . tab ." gt" 
                exec bufwinnr . " wincmd w" 
                return 
            endif 
            tabnext 
            let tab = tab + 1 
        endwhile 
        "not exist, new tab 
        exec "tabnew ". a:filename 
    endif 
endfunction 

"高亮显示当前行/列
set cursorline
set cursorcolumn


"色块宽度
let g:indent_guides_guide_size=1
"
""快捷键i开/关缩进可视化
:nmap<silent> <Leader>i <Plug>IndentGuidesToggle


"UltiSnips  
let g:UltiSnipsExpandTrigger       =  'ii'  
let g:UltiSnipsListSnippets        =  'iI'  
let g:UltiSnipsJumpForwardTrigger  =  'II'  
let g:UltiSnipsJumpBackwardTrigger =  'OO'  



"""""""""" NERDtree settings"""""""""""""""
let NERDTreeWinPos='left'
"关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭，减少多次按:q!。
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif


"other"
set number

"backspace to delete
set backspace=indent,eol,start

let g:fencview_autodetect = 1
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-l>     neocomplcache#complete_common_string()
inoremap <expr><C-g>     neocomplcache#undo_completion()"


function! Blade(...)
    let l:old_makeprg = &makeprg
    setlocal makeprg=blade
    execute "make " . join(a:000)
    let &makeprg=old_makeprg
endfunction
command! -complete=dir -nargs=* Blade call Blade('<args>')

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

"=>单个文件编译
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F7> :call Do_OneFileMake()<CR>
let g:iswindows=0
function Do_OneFileMake()
    if expand("%:p:h")!=getcwd()
        echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press <F7> to redirect to the dir of this file." | echohl None
        return
    endif
    let sourcefileename=expand("%:t")
    if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c"))
        echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
        return
    endif
    let deletedspacefilename=substitute(sourcefileename,' ','','g')
    if strlen(deletedspacefilename)!=strlen(sourcefileename)
        echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
        return
    endif
    if &filetype=="c"
        if g:iswindows==1
            set makeprg=gcc\ -o\ %<.exe\ %
        else
            set makeprg=gcc\ -o\ %<\ %
        endif
    elseif &filetype=="cpp"
        if g:iswindows==1
            set makeprg=g++\ -o\ %<.exe\ %
        else
            set makeprg=g++\ -o\ %<\ %
        endif
    endif
    if(g:iswindows==1)
        let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'.exe','g')
        let toexename=outfilename
    else
        let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'','g')
        let toexename=outfilename
    endif
    if filereadable(outfilename)
        if(g:iswindows==1)
            let outdeletedsuccess=delete(getcwd()."\\".outfilename)
        else
            let outdeletedsuccess=delete("./".outfilename)
        endif
        if(outdeletedsuccess!=0)
            set makeprg=make
            echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
            return
        endif
    endif
    execute "silent make"
    set makeprg=make
    execute "normal :"
    if filereadable(outfilename)
        if(g:iswindows==1)
            execute "!".toexename
        else
            execute "!./".toexename
        endif
    endif
endfunction

"----TarBar------------------------------------------------------------"
nnoremap <silent> <F8> :TagbarToggle<CR>                                                                        
let g:tagbar_left = 1                                "在左侧                                              
let g:tagbar_right = 1                                "在右侧                                              
let g:tagbar_width = 30                               "设置宽度                                            
"autocmd VimEnter * nested :call tagbar#autoopen(1)
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py,*.php call tagbar#autoopen() "tagbar自动开启"

"--ctags setting---------------------------------------------
map <F9> :call ReBuildCtags()<CR>
function! ReBuildCtags()
    exec "!find /home/lincolnlin/QQMail/mmbiz/ -name *.h -o -name *.c -o -name *.cpp > /home/lincolnlin/.vim/src.files && ctags -R --c++-kinds=+px --fields=+iaS --extra=+q -L /home/lincolnlin/.vim/src.files  -f /home/lincolnlin/.vim/tag/mmbiz"
    echohl WarningMsg | echo "ReBuild Ctags Done!" | echohl None
endfunction


"=>"Shell 增强
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
autocmd FileType sh map <F10> :call RunShell()<CR>
autocmd FileType sh imap <F10> :call RunShell()<CR>
autocmd FileType python map <F10> :call RunShell()<CR>
autocmd FileType python imap <F10> :call RunShell()<CR>
autocmd BufNewFile *.cc,*.sh exec ":call SetTitle()"
autocmd BufNewFile *.py exec ":call SetTitlePy()"

"脚本自动跑
function! RunShell()
    exec ":w"
    exec "!./%"
endfunction

"定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if (&filetype == 'sh')
        call setline(1, "#!/bin/bash")
        call append(line("."), "#########################################################################")
        call append(line(".")+1, "# Author: lincolnlin")
        call append(line(".")+2, "# Created Time: ".strftime("%c"))
        call append(line(".")+3, "# File Name: ".expand("%"))
        call append(line(".")+4, "# Description: ")
        call append(line(".")+5, "#########################################################################")
        call append(line(".")+6, "")
    endif
endfunc

func SetTitlePy()
    "如果文件类型为.sh文件
    if (&filetype == 'python')
        call setline(1, "#!/usr/bin/env python")
        call append(line("."), "#########################################################################")
        call append(line(".")+1, "# Author: lincolnlin")
        call append(line(".")+2, "# Created Time: ".strftime("%c"))
        call append(line(".")+3, "# File Name: ".expand("%"))
        call append(line(".")+4, "# Description: ")
        call append(line(".")+5, "#########################################################################")
        call append(line(".")+6, "")
    endif
endfunc

"自动将shell脚本设置为可执行权限
function ModeChange() 
    if getline(1) =~ "^#!"
        if getline(1) =~ "/bin/" 
            silent !chmod a+x <afile> 
        endif 
    endif 
endfunction 
au BufWritePost * call ModeChange()

map <F11> :call UndotreeToggle()<CR>

map <F6> :call PrintHelp()<CR>
function! PrintHelp()
    echohl WarningMsg | echo "F7 单文件编译" | echohl None
    echohl WarningMsg | echo "F8 TarBar" | echohl None
    echohl WarningMsg | echo "F9 ReBuildCtags" | echohl None
    echohl WarningMsg | echo "F10 RunShell" | echohl None
    echohl WarningMsg | echo "F11 Undotree" | echohl None
    echohl WarningMsg | echo "-------------"| echohl None
    echohl WarningMsg | echo ",t TaskList" | echohl None
    echohl WarningMsg | echo "MRU Last_Open_File" | echohl None
    echohl WarningMsg | echo "-------------"| echohl None
    echohl WarningMsg | echo "EasyAlign"| echohl None
endfunction

" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"括号高亮 Rainbow Parentheses"
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['black',       'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"----powerline" PowerlineClearCache
set laststatus=2

"----------EasyMotion"
"let g:EasyMotion_smartcase = 1
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)

"===============EasyAlign========================="
"
"===============AutoForMat========================""
"au BufWrite * :Autoformat


"RandColor
let g:favorite_color_schemes = ['molokai', 'tir_black','jellybeans','peaksea','pyte', 'summerfruit','lucius',]
"0 - Do not use
"1 - Use, default value
"2 - Use, but only when vim is running in the GUI
"3 - Use, but only when vim is NOT runing in the GUI
let g:random_color_start = 3

