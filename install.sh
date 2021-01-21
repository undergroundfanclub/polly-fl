#!/bin/bash
echo "installing dependacies"
sudo apt install -y pulseaudio xinit xorg mpv suckless-tools vim nm-tray nitrogen scrot
echo "install bspwm"
apt install -y bspwm
mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd
cp bsconf/bspwmrc~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/bspwmrc 
cp bsconf/sxhkdrc ~/.config/sxhkd/sxhkdrc

echo "grabbing alacritty"
wget https://github.com/alacritty/alacritty/releases/download/v0.4.2/Alacritty-v0.4.2-ubuntu_18_04_amd64.deb
apt install -y ./Alacritty-v0.4.2-ubuntu_18_04_amd64.deb
mkdir ~/.config/alacritty/
cp alacritty.yml ~/.config/alacratty/alacritty.yml
echo "alacrotty installed"

echo "installing vim"
cp .vimrc ~/.vimrc
echo "vim installed"

echo "would you like (i)cecat/iceweasal or (f)irefox?"
read browser
#if [$browser = f];then
#       apt install firefox
#elif [$browser = i];then
# 	apt install iceweasel
#fi	

echo "touching up"
sudo update-alternatives --config editor
git config --global core.editor "vim"
mkdir ~/dl
mkdir ~/imgs
mkdir ~/imgs/papes
mkdir ~/imgs/scrots
cp yum.jpg ~/imgs/papes
