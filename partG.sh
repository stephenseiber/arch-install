cp /arch-install/makepkgN.conf /etc/makepkg.conf 
pacman -S - </packageN.txt --noconfirm
cp /arch-install/mkinitcpio.conf /etc/mkinitcpio.conf
cp /arch-install/nvidia.hook /etc/pacman.d/hooks/nvidia.hook
cp /arch-install/archN.conf /boot/loader/entries/arch.conf
mkinitcpio -p linux
