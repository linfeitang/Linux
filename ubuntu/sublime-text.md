sublime-text3
通过下载.tar.bz2包的方式安装（因为通过命令方式安装在第一步导入PGP秘钥的时候就一直卡着不动了，所以记录了一下这种方式的安装）

#### 1.首先下载安装包
[官网](https://www.sublimetext.com/3)

#### 2.解压后将得到的sublime_text_3文件夹移动到/opt目录下
`sudo mv sublime_text_3 /opt/`

#### 3.复制.desktop文件到/usr/share/applications/
`sudo cp sublime_text_3/sublime_text.desktop /usr/share/applications/`
这一步是为了能在系统的程序启动菜单中找到它。

#### 4.修改/usr/share/applications/sublime_text.desktop
`sudo vim sublime_text.desktop`

> [Desktop Entry]  
> Version=1.0  
> Type=Application  
> Name=Sublime Text  
> GenericName=Text Editor  
> Comment=Sophisticated text editor for code, markup and prose  
> **Exec=/opt/sublime_text_3/sublime_text %F**  
> Terminal=false  
> MimeType=text/plain;  
> **Icon=sublime-text**  
> Categories=TextEditor;Development;  
> StartupNotify=true  
> Actions=Window;Document;  
>   
> [Desktop Action Window]  
> Name=New Window  
> Exec=/opt/sublime_text/sublime_text -n  
> OnlyShowIn=Unity;  
>   
> [Desktop Action Document]  
> Name=New File  
> Exec=/opt/sublime_text/sublime_text --command new_file  
> OnlyShowIn=Unity;  

***尤其注意Icon这行，我按照网上的说法改为***
`Icon=/opt/sublime_text_3/Icon/48x48/sublime-text.png`

结果虽然能正常使用，但是它的图标是透明的！！
最后直接写成`Icon=sublime-text`反而正常了。
