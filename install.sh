#!/bin/bash

# Simple installer script to help me get started after installing Arch
inst="pacman -S"
home="/home/jo"
tmp="$home/.install/dotfiles"

if [ "$EUID" -ne 0 ]
  then echo "Please run as root user (not sudo)"
  exit
fi

echo "installing xorg..."
$inst "xorg-server xorg-xinit xorg-xsetroot xorg-xrandr xorg-xrdb" 

echo "installing drivers..."
$inst "mesa xf86-video-amdgpu vulkan-radeon"

echo "installing pulseaudio..."
$inst "pulseaudio pulseaudio-alsa alsa-utils"

echo "installing xmonad.."
$inst "xmonad xmonad-contrib"

echo "installing programs..."
$inst "xmobar firefox alacritty xterm exa neovim vim rofi dmenu git wget curl ranger lynx lxappearance picom nitrogen"

echo "installing fonts..."
$inst "ttf-bitstream-vera ttf-croscore ttf-dejavu ttf-droid gnu-free-fonts ttf-ibm-plex ttf-liberation ttf-linux-libertine noto-fonts font-bh-ttf ttf-roboto tex-gyre-fonts ttf-ubuntu-font-family ttf-jetbrains-mono ttf-anonymous-pro ttf-cascadia-code ttf-fira-code ttf-hack"

echo "installing configs..."
mkdir $home/.install
mkdir $home/.config
mkdir $home/.xmonad
git clone https://github.com/joznia/dotfiles.git $tmp
cp -vr $tmp/.xmonad/* $home/.xmonad
cp -vr $tmp/.config/alacritty $home/.config
cp -vr $tmp/.config/picom $home/.config
cp -vr $tmp/.config/xmobar $home/.config

echo "downloading wallpapers..."
git clone https://gitlab.com/dwt1/wallpapers.git > /dev/null

resetprompt () {
        echo "reboot? y or n"
        read -n1 reset
}
echo "done!"
resetprompt

if [ $reset = "y" ];then
        reboot
elif [ $reset = "n" ];then
        exit 0
else
        echo "invalid command"
        resetprompt
fi


