cp copy/pacman.conf /mnt/etc/pacman.conf
cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
cp copy/locale.gen /mnt/etc/locale.gen
mkdir -p /mnt/etc/pacman.d/hooks
cp copy/100-systemd-boot.hook /mnt/etc/pacman.d/hooks/100-systemd-boot.hook
cp copy/sudoers /mnt/etc/sudoers
cp copy/makepkg.conf /mnt/etc/makepkg.conf
cp copy/mkinitcpio.conf /mnt/etc/mkinitcpio.conf
cp copy/nvidia.hook /mnt/etc/pacman.d/hooks/nvidia.hook
cp sh/user.sh /mnt/user.sh
cp sh/yay.sh /mnt/yay.sh
cp sh/part2.sh /mnt/part2.sh
cp sh/packages /mnt/packages
arch-chroot /mnt /bin/bash /part2.sh
cp copy/loader.conf /mnt/boot/loader/loader.conf
cp copy/arch.conf /mnt/boot/loader/entries/arch.conf
