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


su - $SUDO_USER << 'EOF'
cd /tmp
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
EOF

paru -S --noconfirm steam spotify curseforge-bin minecraft-launcher
