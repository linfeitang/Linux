#!/bin/bash
cat .bashrc > ~/.bashrc
cat .nethackrc > ~/.nethackrc
cat .tmux.conf > ~/.tmux.conf
cat .xinitrc > ~/.xinitrc
cat .Xresources > ~/.Xresources
cat i3config > ~/.i3/config
cat i3statusconfig > ~/.config/i3status/config
cp /etc/X11/xinit/xserverrc ~/.xserverrc
mkdir ~/.config/i3status
mkdir ~/.i3