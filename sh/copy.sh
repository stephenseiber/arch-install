cp pacman.conf /mnt/etc/pacman.conf
cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
cp /arch-install/locale.gen /mnt/etc/locale.gen
mkdir -p /mnt/etc/pacman.d/hooks
cp ~/arch-install/100-systemd-boot.hook /mnt/etc/pacman.d/hooks/100-systemd-boot.hook
cp ~/arch-install/loader.conf /mnt/boot/loader/loader.conf
cp ~/arch-install/reflector.conf /mnt/etc/xdg/reflector/reflector.conf
cp ~/arch-install/sudoers /mnt/etc/sudoers
cp ~/arch-install/makepkgN.conf /mnt/etc/makepkg.conf
cp ~/arch-install/mkinitcpio.conf /mnt/etc/mkinitcpio.conf
cp ~/arch-install/nvidia.hook /mnt/etc/pacman.d/hooks/nvidia.hook
cp ~/arch-install/archN.conf /mnt/boot/loader/entries/arch.conf
arch-chroot /mnt /bin/bash /arch-install/part2.sh
