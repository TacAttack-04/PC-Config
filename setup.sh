#!/bin/bash

pacman -Syu --noconfirm && \
pacman -S --noconfirm \
   base-devel \
   nano \
   tailscale \
   micro \
   gparted \
   btop \
   htop \
   firefox \
   discord && \
sed -i '/^\#\[multilib\]/,/^\#Include/ s/^\#//' /etc/pacman.conf && \
pacman -Sy --noconfirm && \
git clone https://aur.archlinux.org/paru.git && \


su - $SUDO_USER -c "
cd paru
makepkg -si --noconfirm
paru -S yay-bin --noconfirm
yay steam
yay spotify
yay curseforge-bin
yay minecraft-launcher
"
