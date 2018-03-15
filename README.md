关于Archlinux的一个简短的安装教程:
-------------------------------------

###1.制作启动盘
###2.开机选择从对应的启动盘启动
###3.验证启动模式:
开机时进入BIOS设置查看或更改引导方式.   
如果以在 UEFI 主板上启用 UEFI 模式, 
Archiso 将会使用 systemd-boot 来启动 Arch Linux。  
可以执行如下命令列出 efivars 目录以验证启动模式:   
	*ls /sys/firmware/efi/efivars*  
如果提示:no such file or directory,  
则表示你的电脑并非UEFI引导而可能是BIOS引导  

###4.连网:  
(1)有线:守护进程 dhcpcd 已被默认启用来探测有线设备, 并会尝试连接。   
(2)无线:wifi-menu(顺便下载dialog软件包)  

5:更新系统时间以确保系统时间是正确的:  
	timedatectl set-ntp true  

6:硬盘分区:
(1)执行#lsblk查看存储设备信息,找到自己要安装的硬盘(以rom,loop,airoot命名的设备不用管)  
(2)分区:
/	必须\n
/home	
/boot	必须(建议200MB)
swap	建议物理内存的1/2
(如果为UEFI,则还需建立一个EFI分区/boot/EFI建议大小200MB)

7:格式化分区并挂载:
(1)格式化
UEFI分区:#mkfs.fat -F32 /dev/?
其他分区:#mkfs.ext4 /dev/?
swap分区:#mkswap /dev/?	格式化为swap格式
	#swapon /dev/?	启动swap分区
(2)挂载
mount /dev/? /mnt   根分区挂到/mnt
mkdir /mnt/home
mount /dev/? /mnt/home
mkdir /mnt/boot
mount /dev/? /mnt/boot


下面是一系列下载安装过程,建议先更改镜像源,让下载速度更快些
-------------------------------------------------------
#nano /etc/pacman.d/mirrorlist
注释掉中国之前的镜像源,让第一个可用的镜像源是中国的,推荐清华镜像源
Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch

8:安装基本系统:
#pacstrap -i /mnt base base-devel(参数-i会询问你是否确认安装)

9:配置系统:
#genfstab -U /mnt >> /mnt/etc/
fstab(-U或-L选项设置UUID或卷标,建议使用UUID)
#cat /mnt/etc/fstab		检查一下生成的/mnt/etc/fstab文件是否正确

10:切换到新系统,进一步设置:
#arch-chroot /mnt		切换到新系统
#pacman -S vim		下载vim
#tzelect			设置时区,依次选择4911
#hwclock --systohc --utc 	设置时间标准为UTC,并调整时间漂移
#vim /etc/locale.gen	注释掉en_US.UTF-8 UTF-8和zh_CN.UTF-8 UTF-8
(本地化的程序与库若要本地化文本，都依赖 Locale, 后者明确规定地域、货币、时区日期的格式、字符排列方式和其他本地化标准等等)
#locale-gen		生成locale讯息
#echo LANG=en_US.UTF-8 >> /etc/locale.conf	设置系统locale
#pacman -S dialog	networkmanager	下载dialog,用于无线联网
#systemctl enable NetworkManager   !!!这步很重要,不然有可能老连不上网
#passwd			设置root账户密码

可以在此时添加用户,也可以以后再添加
#useradd -m -g users -s /bin/bash username
#passwd username
为用户添加sudo权限
#pacman -S sudo 
到/etc/sudoers里添加如下内容
username ALL=(ALL) ALL

11.安装grub引导项
#pacman -S grub 		安装grub引导程序(若为UEFI引导,则还需安装efibootmgr)
传统引导方式,将引导信息写入到硬盘(!不是某个分区)
#grub-install --target=i386-pc /dev/sdx		
UEFI引导方式,将引导信息写入到硬盘
#grub-install --target=x86_64-efi --efi-directory=esp_mount --bootloader-id=grub     
#pacman -S intel-ucode	
处理器厂商会发布 microcode 以增强系统稳定性和解决安全问题。Microcode 可以通过 BIOS 更新，Linux 内核也支持启动时应用新的 Microcode。没有这些更新，可能会遇到一些很难查的的死机或崩溃问题。
#grub-mkconfig -o /boot/grub/grub.cfg	生成配置文件grub.cfg
安装yaourt
在文件/etc/pacman.conf最后添加如下内容
[archlinuxcn]
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
下载archlinuxcn-keyring

#exit			退出chroot环境
#umount -R /mnt		卸载分区
#reboot 		重启系统：systemd 将自动卸载仍然挂载的任何分区。不要忘记移除安装介质，然后使用rooet帐户登录到新系统。

END!!! 

后续可选择性安装桌面环境
要想系统性能最大化,可以只安装窗口管理器
堆叠式:Openbox,FVWM,Compiz等
平铺式:dswm等
动态式:i3等

*因为所有的桌面环境都以X为基础,所以必须安装*
#pacman -S xorg(安装i3的话好像可以不用这整个包组