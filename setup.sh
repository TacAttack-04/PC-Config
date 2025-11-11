#!/bin/bash

pacman -Syu --noconfirm && \
pacman -S --noconfirm \
   base-devel \
   nano \
   tailscale \
   micro \
   gParted \
   btop \
   htop \
   firefox
sed -i '/^\#\[multilib\]/,/^\#Include/ s/^\#//' /etc/pacman.conf
pacman -Syu --noconfirm
git clone https://aur.archlinux.org/paru.git
cd paru
print f '1\y\y' | makepkg -si
paru yay-bin --noconfirm
print f '1\1\y' | yay steam
print f '1\a\n\y\y\y' | yay spotify
print f '1\a\n\y\y\y' | yay curseforge-bin
print f '1\a\n\y' | yay minecraft-launcher
pacman -S discord
