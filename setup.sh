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

# Install yay-bin and cleanup
pacman -U --noconfirm /tmp/yay-bin/yay-bin-*.pkg.tar.zst && \
rm -rf /tmp/yay-bin && \

# Import Spotify key and install packages
# Using sudo -u to preserve sudo credentials
sudo -u $SUDO_USER bash << 'EOF'
gpg --keyserver keyserver.ubuntu.com --recv-keys 5E3C45D7B312C643
yay -S --noconfirm steam spotify curseforge-bin minecraft-launcher
EOF
