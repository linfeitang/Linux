#### 1.选择主题并下载压缩包
https://www.gnome-look.org/browse/cat/109/
#### 2.创建一个新的文件夹

	$sudo mkdir /boot/grub/themes
#### 3.把压缩后的主题文件夹复制到themes中
 
	$sudo cp themepackage /boot/grub/themes
#### 4.编辑 /etc/grub.d/00_header 并在一大堆 # 的注释后面添加下列内容:
	
	$sudo vim /etc/grub.d/00_header
	要添加的内容是:
	GRUB_THEME="/boot/grub/themes/theme_name/theme.txt"
#### 5.更新grub文件

	$sudo update-grub
