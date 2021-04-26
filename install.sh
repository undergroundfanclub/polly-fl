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
cat dependacies | xargs sudo apt install

mkdir ~/.config

mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd

cp bsconf/bspwmrc ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/bspwmrc 
cp bsconf/sxhkdrc ~/.config/sxhkd/sxhkdrc
echo "bspwm installed"

echo "installing kitty conf"
mkdir ~/.config/kitty/
cp kitty.conf ~/.config/kitty/
echo "kitty installed"

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
mkdir ~/prj
mkdir ~/tmp
cp .bashrc ~/.bashrc
cp shellaliases ~/.config/shellaliases
mkdir ~/.config/tint2
cp tint2rc ~/.config/tint2/
cp .conkyrc ~/
source ~/.bashrc

echo 'modules'

updatebackports () { ./modules/updatebackports;}
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

yesvirt () { ./modules/virt-qemu; }
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

echo 'polly debian flavor has been installed! please restart'
