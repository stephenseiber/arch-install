mount -o remount,size=4G /run/archiso/cowspace
df -l
pacman -Sy reflector --noconfirm
ls /sys/firmware/efi/efivars
timedatectl set-ntp true
reflector --latest 50 --verbose  --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sh format.sh
sh pacstrap.sh
genfstab -U /mnt >> /mnt/etc/fstab
sh copy.sh
arch-chroot /mnt /bin/bash /arch-install/part2.sh
reboot
