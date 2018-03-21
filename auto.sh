#!/bin/bash

mkdir ~/.i3
cat i3config > ~/.i3/config
cat i3statusconfig > ~/.config/i3status/config
cat .bashrc > ~/.bashrc
cat .tmux.conf > ~/.tmux.conf
cat .nethackrc > ~/.nethackrc
cat .Xresources > ~/.Xresources
cat .xinitrc > ~/.xinitrc

cp /etc/X11/xinit/xserverrc ~/.xserverrc