dd if=/dev/zero of=/mnt/swapfile bs=1M count=1024 status=progress
chmod 600 /mnt/swapfile
mkswap /mnt/swapfile
swapon /mnt/swapfile
pacstrap /mnt fish pacman git nano
genfstab -U /mnt >> /mnt/etc/fstab
cp ~/arch-install /mnt/arch-install
cp pacman.conf /mnt/etc/pacman.conf
cp package.txt /mnt/package.txt
cp packageN.txt /mnt/packageN.txt
reflector --verbose -l 10 --sort rate --save /mnt/etc/pacman.d/mirrorlist
arch-chroot /mnt /bin/fish
