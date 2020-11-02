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
sudo systemctl enable optimus-manager
sudo systemctl start optimus-manager
sudo su
pacman -Sy arch-install-scripts --noconfirm
rm -R /etc/fstab
genfstab -U / >> /etc/fstab
pacman -Rs arch-install-scripts --noconfirm
