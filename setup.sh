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

# Build yay-bin (smaller bootstrap)
su - $SUDO_USER << 'EOF'
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg --noconfirm
EOF

# Install yay-bin and cleanup
pacman -U --noconfirm /tmp/yay-bin/yay-bin-*.pkg.tar.zst && \
rm -rf /tmp/yay-bin && \

# Use yay to install everything else
su - $SUDO_USER -c "yay -S --noconfirm paru-bin steam spotify curseforge-bin minecraft-launcher"
