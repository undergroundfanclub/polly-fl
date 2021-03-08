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

updatebackports () {echo "test"}
#{echo "deb http://deb.debian.org/debian stretch-backports main" | tee -a /etc/apt/sources.list
#apt-get update}
echo "would you like to use backports?[y/n]"
read yon
if ["$yon" = y]; then
    updatebackports
elif [ "$yon" = n ]; then
    echo "your loss"
else
    echo "Not a valid answer."
    sleep 2

fi

echo "installing dependacies"
sudo apt install pulseaudio pavucontrol bspwm tint2 xinit conky libnotify4 fonts-firacode xorg
lightdm vim feh scrot firefox-esr wget gcc make cmake cbatticon volumeicon-alsa
network-manager-gnome suckless-tools
mkdir ~/.config

mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd

cp bsconf/bspwmrc ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/bspwmrc 
cp bsconf/sxhkdrc ~/.config/sxhkd/sxhkdrc
echo "bspwm installed"

echo "grabbing alacritty"
#wget https://github.com/alacritty/alacritty/releases/download/v0.4.2/Alacritty-v0.4.2-ubuntu_18_04_amd64.deb
#sudo apt install -y ./Alacritty-v0.4.2-ubuntu_18_04_amd64.deb
#mkdir ~/.config/alacritty/
#cp alacritty.yml ~/.config/alacritty/alacritty.yml
#echo "alacritty installed"

echo "installing vim"
cp .vimrc ~/.vimrc
echo "vim installed"

yesvirt () { sudo apt install qemu virt-manager; }
novirt () { echo "will not install qemu nor virt-manager"; }
echo "Would you like to add qemu and virt-manager(frontend)? (y/n)"
read yesorno
if [ "$yesorno" = y ]; then
    yesvirt
elif [ "$yesorno" = n ]; then
    novirt
else
    echo "Not a valid answer."
    sleep 2
fi

echo "touching up"
sudo update-alternatives --config editor
git config --global core.editor "vim"
mkdir ~/dl
mkdir ~/imgs
mkdir ~/imgs/papes
mkdir ~/imgs/scrots
cp flower.png ~/imgs/papes
cp .bashrc ~/.bashrc
cp shellaliases ~/.config/shellaliases
mkdir ~/.config/tint2
cp tint2rc ~/.config/tint2/
cp .conkyrc ~/
source ~/.bashrc
echo "polly debian flavor has been installed! \n please restart"
