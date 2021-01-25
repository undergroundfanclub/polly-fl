#!/bin/bash

# Detect OS
# $os_version variables aren't always in use, but are kept here for convenience
if [[ -e /etc/debian_version ]]; then
	os="debian"
	os_version=$(grep -oE '[0-9]+' /etc/debian_version | head -1)
	group_name="nogroup"
else
	echo "This installer seems to be running on an unsupported distribution. \n
  this script is written for Debian 10 (Buster) main"
	exit
fi

echo "installing dependacies"
sudo apt install -y pulseaudio pavucontrol lxpanel bspwm xinit conky libnotify4 fonts-firacode xorg slim vim nitrogen scrot firefox-esr wget gcc make xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev xdo libxcb-shape0-dev  suckless-tools
mkdir ~/.config

mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd

cp bsconf/bspwmrc ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/bspwmrc 
cp bsconf/sxhkdrc ~/.config/sxhkd/sxhkdrc
echo "bspwm installed"

echo "grabbing alacritty"
wget https://github.com/alacritty/alacritty/releases/download/v0.4.2/Alacritty-v0.4.2-ubuntu_18_04_amd64.deb
sudo apt install -y ./Alacritty-v0.4.2-ubuntu_18_04_amd64.deb
mkdir ~/.config/alacritty/
cp alacritty.yml ~/.config/alacritty/alacritty.yml
echo "alacritty installed"

echo "installing vim"
cp .vimrc ~/.vimrc
echo "vim installed"

echo 'install slim theme'
git clone https://github.com/adi1090x/slim_themes.git
cp -r slim_themes/themes /usr/share/slim/themes

echo "touching up"
sudo update-alternatives --config editor
git config --global core.editor "vim"
mkdir ~/dl
mkdir ~/imgs
mkdir ~/imgs/papes
mkdir ~/imgs/scrots
cp sys2tile.png ~/imgs/papes
cp .bashrc ~/.bashrc
cp shellaliases ~/.config/shellaliases
cp .conkyrc ~/
source ~/.bashrc
echo 'polly debian flavor has been installed!
please restart or "startx" at your own risk'