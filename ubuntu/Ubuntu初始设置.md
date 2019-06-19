### 1.dock点击图标最小化应用程序
$ gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

### 2.搜狗输入法的安装
- 通过snap商店下载"fcitx"和"fcitx配置"
- 进入到"语言支持"把输入法引擎改为fcitx。
- 下载搜狗输入法的.deb包并安装
`sudo dpkg -i sogouxxx.deb`
- 注销或重启就可以了

### 3.关于扩展
`$ sudo apt install gnome-shell-extensions`
`$ sudo apt install chrome-gnome-shell`

如果安装了其他dock，建议卸载掉ubuntu-dock
`$ sudo apt remove --purge gnome-shell-extensions-ubuntu-dock`
