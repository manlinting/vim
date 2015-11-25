map <F6> :call PrintHelp()<CR>
function! PrintHelp()
    echohl WarningMsg | echo "=============F快捷键==========="| echohl None
    echohl WarningMsg | echo "F7 单文件编译" | echohl None
    echohl WarningMsg | echo "F8 TarBar" | echohl None
    echohl WarningMsg | echo "F9 ReBuildCtags" | echohl None
    echohl WarningMsg | echo "F10 RunShell" | echohl None
    echohl WarningMsg | echo "F11 Undotree" | echohl None
    echohl WarningMsg | echo "F12 NERDTreeToggle" | echohl None
    echohl WarningMsg | echo "============原生插件==========="| echohl None
    echohl WarningMsg | echo "MRU Last_Open_File" | echohl None
    echohl WarningMsg | echo "EasyAlign"| echohl None
    echohl WarningMsg | echo "============<leader>插件======="| echohl None
    echohl WarningMsg | echo "<C-P> CtrlP" | echohl None
    echohl WarningMsg | echo ",t TaskList" | echohl None
    echohl WarningMsg | echo ",e Open .vimrc" | echohl None
    echohl WarningMsg | echo "UltiSnips: box|bbox MMERR|MMDEBUG|MMINFO cl|inc"| echohl None
    echohl WarningMsg | echo "FencView: FencAutoDectect|FencView"| echohl None
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Global                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","

"高亮显示当前行/列
set cursorline
set cursorcolumn

filetype plugin indent on
syntax on

set novisualbell "不要闪烁

set number

"纪录上次打开位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Comm Function                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"SwitchToBuf()实现它在所有标签页的窗口中查找指定的文件名,如果找到这样一个窗口,
"就跳到此窗口中；否则，它新建一个标签页来打开vimrc文件 
"自动编辑.vimrc文件用到的函数
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   vundle                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"filetype should be off before loading vundle
filetype off
Bundle 'gmarik/vundle'

""""""""""""""
"  vim scri  "
""""""""""""""
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
Bundle "FencView.vim"

"if no YouCompleteMe
Bundle 'neocomplcache'
Bundle 'OmniCppComplete'

""""""""""""""
"  git repo  "
""""""""""""""
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'SirVer/ultisnips' 
Bundle 'honza/vim-snippets'
Bundle 'kevinw/pyflakes-vim'

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
"Bundle 'Valloric/YouCompleteMe'
Bundle 'flazz/vim-colorschemes'
Bundle "tpope/vim-pathogen"
"""""""""""""""
"  full path  "
"""""""""""""""
Bundle 'git://github.com/nathanaelkane/vim-indent-guides.git'
filetype on 






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                     搜索                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase "大小写无关
set hlsearch "高亮显示结果
set incsearch "在输入要搜索的文字时，vim会实时匹配
"----------EasyMotion"
"let g:EasyMotion_smartcase = 1
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  文件编码                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  fencview                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fencview_autodetect = 1
"遇到乱码时，可用:FencAutoDectect自动检测,并追加到fileencodings中










""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Text Option                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4	"(自动) 缩进每一步使用的空白数目.用于 "cindent", ">>", "<<" 等.
set softtabstop=4
set tabstop=4
set smarttab
"backspace to delete
set backspace=indent,eol,start
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             indent-guides 对齐线                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"色块宽度
let g:indent_guides_guide_size=1
""快捷键i开/关缩进可视化
:nmap<silent> <Leader>i <Plug>IndentGuidesToggle





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  文件管理                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  NERDtree                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeWinPos='left'
"关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭，减少多次按:q!。
map <F12> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif







""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  自动补全                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               neocomplcache                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-l>     neocomplcache#complete_common_string()
inoremap <expr><C-g>     neocomplcache#undo_completion()"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             YouCompleteMe YCM                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

let g:ycm_confirm_extra_conf=0
" 开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_collect_identifiers_from_tags_files=1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1	
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}
"youcompleteme  默认tab  s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" " 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" " 引入 C++ 标准库tags
"set tags+=/data/misc/software/misc./vim/stdcpp.tags
" " YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" " 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" " 从第一个键入字符就开始罗列匹配项
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  UltiSnips                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsListSnippets = '<C-Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsListSnippets="<c-e>"
" 参考https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-62941322
" 解决ultisnips和ycm tab冲突，如果不使用下面的办法解决可以参考
" https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-63205056的配置
" begin
" let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
" let g:UltiSnipsExpandTrigger="<Tab>"
" let g:UltiSnipsJumpForwardTrigger="<Tab>"                                           
" let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" end
" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB key 
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" Expand snippet or return
let g:ulti_expand_res = 1
function! Ulti_ExpandOrEnter()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ''
    else
        return "\<return>"
endfunction

" Set <space> as primary trigger
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   编程                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               单个文件编译                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   TarBar                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F8> :TagbarToggle<CR>                                                                        
let g:tagbar_left = 1                                "在左侧                                              
let g:tagbar_right = 1                                "在右侧                                              
let g:tagbar_width = 30                               "设置宽度                                            
"autocmd VimEnter * nested :call tagbar#autoopen(1)
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py,*.php call tagbar#autoopen() "tagbar自动开启"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               ctags setting                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TODO Define Your Tag Position
"注意=后不可有空格"
set tags+=~/.vim/tag/mmbiz
set tags+=~/.vim/tag/stl
set tags+=~/QQMail/mm3rd/boost/tags
map <F9> :call ReBuildCtags()<CR>
"TODO Define Your Tags Generate Function"
function! ReBuildCtags()
    exec "!find ~/QQMail/mmbiz/ -name *.h -o -name *.c -o -name *.cpp > ~/.vim/src.files && ctags -R --c++-kinds=+px --fields=+iaS --extra=+q -L ~/.vim/src.files  -f ~/.vim/tag/mmbiz"
    echohl WarningMsg | echo "ReBuild Ctags Done!" | echohl None
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Undotree                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F11> :call UndotreeToggle()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          RainbowParent括号高亮                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 syntastic                                  "
"                                 TODO cpp没生效，待研究                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'

"set error or warning signs
let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = '*'
"whether to show balloons
let g:syntastic_enable_balloons = 1
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_html_checkers=['tidy', 'jshint']
let errorformat = '%W%f(%l): %tarning #%n: %m,%E%f(%l): %trror: %m'
" 修改高亮的背景色, 适应主题
highlight SyntasticErrorSign guifg=white guibg=black"
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error , location panel
        Errors
    endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    状态栏                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----powerline" PowerlineClearCache
set laststatus=2




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Color                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 RandColor                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
let g:rehash256 = 1
let g:favorite_color_schemes = ['molokai', 'tir_black', 'lucius',]
"0 - Do not use
"1 - Use, default value
"2 - Use, but only when vim is running in the GUI
"3 - Use, but only when vim is NOT runing in the GUI
let g:random_color_start = 3



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Shell 增强                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shell=bash
"设置快速编辑.vimrc文件 ,e 编辑.vimrc    保存.vimrc文件后会自动调用新的.vimrc 
noremap <silent> <leader>e :call SwitchToBuf($MYVIMRC)<cr> 
autocmd! bufwritepost *vimrc* source $MYVIMRC 
autocmd FileType sh map <F10> :call RunShell()<CR>
autocmd FileType sh imap <F10> :call RunShell()<CR>
autocmd FileType python map <F10> :call RunShell()<CR>
autocmd FileType python imap <F10> :call RunShell()<CR>
autocmd BufNewFile *.sh exec ":call SetTitle()"
autocmd BufNewFile *.py exec ":call SetTitlePy()"
au BufWritePost * call ModeChange()

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
