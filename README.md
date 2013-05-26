vim-plugin-dev
==============

这个Repo保存自己平时根据需要写的一些基于python的vim plugin。由于自己接触vim的日子比较短也比较晚，
所以不打算正儿八经去学习vim script了，所以这些plugin都基本上全是python完成的。

## trans.vim 
在用vim读一些英文东西的时候，需要临时查一下某些不认识的单词。但无论打开软件或者网页都略显麻烦，
所以我决定写一个插件来帮我查询当前位置的单词，将解释显示在屏幕底部。plugin里面实际上就是一个
函数。使用方法非常简单，将光标停在需要查询的单词上，然后输入

:call Translate()

就会通过有道在线词典在线API翻译当前的单词。当然，为了更加方便还可以在.vimrc中绑定热键，例如

nnoremap <silent> ,t :call Translate() <CR>

很简单吧！当然，使用之前还需要到http://fanyi.youdao.com/openapi 这里去申请一个自己的key（‘{‘和'}'不要），
然后把trans.vim里面对应的地方替换掉就可以了，替换好后建议先在浏览器下试试对应的url能不能正常工作。
如果一切顺利，那么

:source $path/trans.vim

:call Translate()

就会有如下效果啦！

![ScreenShot](https://raw.github.com/liqunli/vim-plugin-dev/master/Screenshot%20from%202013-05-26%2010:57:51.png)

## dairy.vim
平时喜欢写写日记，所以就想起了很久以前老师教的——在日记的头一行写下日期、星期几和天气。这个操作每天都有做，
于是我写了个plugin来专门帮我自动生成这一行。实现方式跟上一个插件基本上一样的，唯一的不同就是需要查询另外
一个天气服务API。这里我用的是http://openweathermap.org/data/2.1/find/name?q={cityname} 后面将'{cityname}'
替换为自己需要查询的城市名称就可以了。

生成的日记头如下所示
![ScreenShot](https://raw.github.com/liqunli/vim-plugin-dev/master/Screenshot%20from%202013-05-26%2011:20:52.png)
