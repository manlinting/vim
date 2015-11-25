# vim
---

##主要特性

*   偏后台开发，c++,python,shell等写得比较多的情况
*   只支持linux系统
*   使用Vundle管理插件，vimrc代码简洁，注释多，易上手
---

##安装方式

###先安装vim7.4 +python 

```
./configure --with-features=huge --enable-multibyte  --enable-rubyinterp=yes --enable-pythoninterp=yes   --enable-perlinterp=yes --enable-luainterp=yes --enable-cscope --prefix=yourprefix
```

###安装方式1：完整方式 
```
git clone https://github.com/manlinting/vim ~/
```

###安装方式2： 只下载.vimrc

在有网络的情况下,可使用install.sh脚本快速安装

---

##vimrc目录
进入Vim后，按F6，会打印需要经常会用到的插件命令

-   Global  一些通用配置，依赖个人习惯
-   Comm Function   公用的方法 
-   管理插件    使用Vundle插件
-   搜索相关    用了下EasyMotion，感觉不太适用，还是vim内置的好
-   文件编码    全部设置成utf-8,兼容中文编码,使用fencview插件查看和自动识别文件编码
-   文本选项    设置自动缩进等选项，使用indent-guides和IndentLine插件提供对齐线 
-   文件管理    快速打开目录和搜索文件，NERDTree+CtrlP
-   自动补全    YouCompleteMe，在有些环境下如果安装不了YouCompleteMe的话，使用neocomplcache+OmniCppComplete代替
-   补全代码段  ultisnips+snippets,自定义的脚本放在~/.vim/UltiSnips/目录下
-   编程增强    单个C++文件一键编译执行,一键重新生成tag文件,使用TarBar插件大纲式导航
-   脚本增强    shell,py脚本自动添加文件头，一键加执行权限+保存+运行
-   配色方案    搞了几种喜欢的colorscheme,每次打开文件随机，避免审美疲劳
-   其它    Undotree:快速回滚， airline:轻量级状态栏装饰

---

##演示

-   总体感觉

---

![](https://raw.githubusercontent.com/manlinting/vim/master/gif/total.gif)

-   F6打印所有帮助命令  快速修改.vimrc,保存时生效

---

![](https://raw.githubusercontent.com/manlinting/vim/master/gif/f6.gif)

-   补全

---

![](https://raw.githubusercontent.com/manlinting/vim/master/gif/cpp.gif)

-   Shell增强

---

![](https://raw.githubusercontent.com/manlinting/vim/master/gif/shell.gif)


