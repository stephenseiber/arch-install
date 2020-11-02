pacman -Sy arch-install-scripts --noconfirm
rm -R /etc/fstab
genfstab -U / >> /etc/fstab
pacman -Rs arch-install-scripts --noconfirm 
