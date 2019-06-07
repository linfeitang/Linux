### grep命令：
> --color=auto &emsp;对匹配到的文本着色显示  
> -n 				&emsp;显示匹配的字符所在的行号  
> -i 				&emsp;忽略搜索字符的大小写（因为Linux对大小写是敏感的）
> -c 				&emsp;统计匹配的行数
> -v 				&emsp;显示不被pattern匹配到的行
> -q 				&emsp;静默模式，不做任何输出显示。但有个返回值会被存储到？这个变量中
&emsp;&emsp;&nbsp;要显示的话可以输入$?,若0，则有该字符串，若1，则没有。

> -A# 				&emsp;after,连同后#行一起显示
> -B# 				&emsp;before,连同前#行一起显示
> -C# 				&emsp;context,连同前后各#行一起显示
> -e 				&emsp;&emsp;实现多个选项间的逻辑or关系
`grep -e 'cat' -e 'dog' file`
>-w 				&emsp;匹配整个单词
> -E 				&emsp;使用ERP

