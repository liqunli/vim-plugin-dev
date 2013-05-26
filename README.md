vim-plugin-dev
==============

这个Repo保存自己平时根据需要写的一些基于python的vim plugin。由于自己接触vim的日子比较短也比较晚，
所以不打算正儿八经去学习vim script了，所以这些plugin都基本上全是python完成的。

# trans.vim 
在用vim读一些英文东西的时候，需要临时查一下某些不认识的单词。但无论打开软件或者网页都略显麻烦，
所以我决定写一个插件来帮我查询当前位置的单词，将解释显示在屏幕底部。plugin里面实际上就是一个
函数。使用方法非常简单，将光标停在需要查询的单词上，然后输入

:call Translate()

就会通过有道在线词典在线API翻译当前的单词。当然，为了更加方便还可以在.vimrc中绑定热键，例如

nnoremap <silent> ,t :call Translate() <CR>

很简单吧！当然，使用之前还需要到http://fanyi.youdao.com/openapi这里去申请一个自己的key（‘{‘和'}'不要），
然后把trans.vim里面对应的地方替换掉就可以了，替换好后建议先在浏览器下试试对应的url能不能正常工作。
如果一切顺利，那么

:source $path/trans.vim
:call Translate()

就会有如下效果啦！


