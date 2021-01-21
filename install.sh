#!/bin/bash
echo "installing dependacies"
sudo apt install -y pulseaudio xinit xorg mpv suckless-tools vim nm-tray nitrogen scrot firefox-esr
echo "install bspwm"
apt install -y bspwm sxhkd
mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd
cp bsconf/bspwmrc~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/bspwmrc 
cp bsconf/sxhkdrc ~/.config/sxhkd/sxhkdrc
sudo cp bspwm/contrib/freedesktop/bspwm.desktop /usr/share/xsessions

echo "grabbing alacritty"
wget https://github.com/alacritty/alacritty/releases/download/v0.4.2/Alacritty-v0.4.2-ubuntu_18_04_amd64.deb
apt install -y ./Alacritty-v0.4.2-ubuntu_18_04_amd64.deb
mkdir ~/.config/alacritty/
cp alacritty.yml ~/.config/alacritty/alacritty.yml
echo "alacritty installed"

echo "installing vim"
cp .vimrc ~/.vimrc
echo "vim installed"

echo "touching up"
sudo update-alternatives --config editor
git config --global core.editor "vim"
mkdir ~/dl
mkdir ~/imgs
mkdir ~/imgs/papes
mkdir ~/imgs/scrots
cp yum.jpg ~/imgs/papes
