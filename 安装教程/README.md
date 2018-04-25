关于Archlinux的一个简短的安装教程:
=================================
### 1.制作启动盘  
### 2.开机选择从对应的启动盘启动  
### 3.验证启动模式:  
开机时进入BIOS设置查看或更改引导方式.   
如果以在 UEFI 主板上启用 UEFI 模式, 
Archiso 将会使用 systemd-boot 来启动 Arch Linux。  
可以执行如下命令列出 efivars 目录以验证启动模式:  

	ls /sys/firmware/efi/efivars  
如果提示:no such file or directory,  
则表示你的电脑并非UEFI引导而可能是BIOS引导  

### 4.连网:  
- 有线:守护进程 dhcpcd 已被默认启用来探测有线设备, 并会尝试连接。   
- 无线:wifi-menu(顺便下载dialog软件包)  

### 5:更新系统时间以确保系统时间是正确的:  
	timedatectl set-ntp true  

### 6:硬盘分区:	
执行lsblk查看存储设备信息,找到自己要安装的硬盘(以rom,loop,airoot命名的设备不用管)  	
分区:

>/		必须  
>/home  	 
>/boot	必须(建议200MB)     	
>swap	建议物理内存的1/2  	  	
(如果为UEFI,则还需建立一个EFI分区/boot/EFI建议大小200MB)  	

### 7:格式化分区并挂载:	
格式化    
UEFI分区:	

	mkfs.fat -F32 /dev/?	
其他分区:	

	mkfs.ext4 /dev/?	
swap分区:	

	mkswap /dev/?	格式化为swap格式		
	swapon /dev/?	启动swap分区		
挂载

	mount /dev/? /mnt   根分区挂到/mnt
	mkdir /mnt/home
	mount /dev/? /mnt/home
	mkdir /mnt/boot
	mount /dev/? /mnt/boot


*下面是一系列下载安装过程,建议先更改镜像源,让下载速度更快些*
-------------------------------------------------------
	nano /etc/pacman.d/mirrorlist	
注释掉中国之前的镜像源,让第一个可用的镜像源是中国的,推荐清华镜像源:  

	Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch   	
	
### 8:安装基本系统:	
	pacstrap -i /mnt base base-devel(参数-i会询问你是否确认安装)		

### 9:配置系统:		
	genfstab -U /mnt >> /mnt/etc/fstab    (-U或-L选项设置UUID或卷标,建议使用UUID)
	cat /mnt/etc/fstab		          检查一下生成的/mnt/etc/fstab文件是否正确	
	
### 10:切换到新系统,进一步设置:	

	arch-chroot /mnt			切换到新系统		
	pacman -S vim				下载vim		
	tzelect					设置时区,依次选择4911			
	hwclock --systohc --utc 		设置时间标准为UTC,并调整时间漂移	
	vim /etc/locale.gen			注释掉en_US.UTF-8 UTF-8和zh_CN.UTF-8 UTF-8	
(本地化的程序与库若要本地化文本，都依赖 Locale, 	后者明确规定地域、货币、时区日期的格式、字符排列方式和其他本地化标准等等)	

	locale-gen				生成locale讯息		
	pacman -S dialog networkmanager	    下载dialog,用于无线联网	
	systemctl enable NetworkManager      !!!这步很重要,不然有可能老连不上网	
	passwd					设置root账户密码		

*可以在此时添加用户,也可以以后再添加*  

	useradd -m -g users -s /bin/bash username		
	passwd username	
*为用户添加sudo权限*  	

	pacman -S sudo 		下载sudo
	vim /etc/sudoers       添加如下内容	
>username ALL=(ALL) ALL	

### 11.安装grub引导项 
	pacman -S grub 		安装grub引导程序(若为UEFI引导,则还需安装efibootmgr) 
##### !下面的grub-install命令是要将引导信息写入到整个系统所在的硬盘,而不是某个分区
若为传统引导方式,  

	grub-install --target=i386-pc /dev/sdx		
若为UEFI引导方式,

	grub-install --target=x86_64-efi --efi-directory=esp_mount --bootloader-id=grub      	
处理器厂商会发布 microcode 以增强系统稳定性和解决安全问题。Microcode 可以通过 BIOS 更新，Linux   内核也支持启动时应用新的 Microcode。没有这些更新，可能会遇到一些很难查的的死机或崩溃问题。  

	pacman -S intel-ucode
生成配置文件grub.cfg  

	grub-mkconfig -o /boot/grub/grub.cfg	   
安装yaourt  

	vim /etc/pacman.conf        在最后添加如下内容  
>[archlinuxcn]  
>Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch  
  
	pacman -S archlinux-keyring  下载archlinuxcn-keyring 
	exit						推出当前环境
	umount -R /mnt					卸载分区  
	reboot 						重启系统(也可以不重启,直接安装自己需要的环境)
将自动卸载仍然挂载的任何分区。不要忘记移除安装介质，然后使用rooet帐户登录到新系统。  

**至此,基本系统就已经基本完成了,但只有命令行界面,不过这才是linux的真谛啊(ﾟ▽ﾟ)**

##### 后续可选择性安装桌面环境,要想系统性能最大化,可以只安装窗口管理器  
>堆叠式:Openbox,FVWM,Compiz等   
>平铺式:dswm等   
>动态式:i3等  
>具体请参考:  
>https://wiki.archlinux.org/index.php/Window_manager

*因为所有的桌面环境都以X为基础,所以必须安装xorg*  

	pacman -S xorg(安装i3的话好像可以不用这整个包组) 


______________________________________________________________________________

# 下面是关于i3wm的一些说明
***之所以选择i3,起初纯粹是觉得帅,特别是配置成功之后的那种成就感(ﾟдﾟ≡ﾟдﾟ) ,后来发现不仅仅是帅这么简单(┌|◎o◎|┘ 恐惧加深)~~~~~~~~~~~***
>参考官网https://i3wm.org/
### 1.下载i3
	pacman -S i3-gaps i3blocks i3lock i3status (此处选择i3-gaps作为i3-wm的替代,是为了实现i3bar的透明化)
	pacman -S feh       		       (用来设置壁纸)
	pacman -S dmenu				   (作为系统的程序启动器,因为i3桌面上是没有任何类似于Windows的快捷图标的)
### 2.为了能在在tty界面使用startx命令启动i3WM,请先下载  

	pacman -S xorg-xinit
	pacman -S xorg-server
然后复制

	cp /etc/X11/xinit/xinitrc ~/.xinitrc
    cp /etc/X11/xinit/xserverrc ~/.xserverrc
编辑~/.xinitrc,在末尾添加exec i3(或者其他的窗口管理器)  
注意,此后还需要下载  

	ttf-dejavu 
	wqy-microhei
否则登陆进去后可能是乱码!

### 3.让工作区显示图标,请下载font-awesome这套图标字体 
>http://fontawesome.dashgame.com/

然后unzip命令解压,切换到目录  
(如果系统提示找不到命令,请先下载unzip)  

	sudo pacman -S unzip		    (下载unzip)
	cd Downloads/font-awesome-4.7.0/fonts  (具体版本号以你下载的为准)
	mkdir ~/.fonts
	mv fontawesome-webfont.ttf ~/.fonts

最后到网站下载图标复制到~/.i3/config对应的workspace设置里面
>https://fontawesome.bootstrapcheatsheets.com/

### 4.其他一些具体的配置文件请参考:
>https://github.com/linfeitang/i3

>效果图:  
http://a1.qpic.cn/psb?/V10psO2g0ublGH/QK5Rui0TB.JJl3SubzI11b1hI30bQPrQhdkTH23j59g!/b/dPQAAAAAAAAA&ek=1&kp=1&pt=0&bo=IgNZAgAAAAADN2g!&vuin=2831248375&tm=1521086400&sce=60-2-2&rf=viewer_4

*这些还远远不够全面.又想起了那句话:  
技术如此高深,生命如此短暂*
