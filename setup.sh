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

# Build yay-bin
su - $SUDO_USER << 'EOF'
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg --noconfirm
EOF

pacman -U --noconfirm /tmp/yay-bin/yay-bin-*.pkg.tar.zst && \
rm -rf /tmp/yay-bin && \

sudo -u $SUDO_USER bash << 'EOF'
yay -S --noconfirm steam spotify curseforge-bin minecraft-launcher spotify-player
EOF
