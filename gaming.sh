git clone https://aur.archlinux.org/optimus-manager.git
cd optimus-manager
makepkg -si --noconfirm
cd ..
rm -Rf optimus-manager
git clone https://aur.archlinux.org/optimus-manager-qt.git
cd optimus-manager-qt
makepkg -si --noconfirm
cd ..
rm -Rf optimus-manager-qt
systemctl enable optimus-manager
systemctl start optimus-manager
pacman -Sy arch-install-scripts --noconfirm
rm -R /etc/fstab
genfstab -U / >> /etc/fstab
pacman -Rs arch-install-scripts --noconfirm
