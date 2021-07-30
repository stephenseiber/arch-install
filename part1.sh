mount -o remount,size=4G /run/archiso/cowspace
df -l
pacman -Sy reflector dialog --noconfirm
ls /sys/firmware/efi/efivars
timedatectl set-ntp true
reflector --latest 50 --verbose  --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
parted --script /dev/sda -- mklabel gpt \
  mkpart ESP fat32 1Mib 275MiB \
  set 1 boot on \
  mkpart primary ext4 275MiB 100%
wipefs /dev/sda1
wipefs /dev/sda2
mkfs.vfat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
e2label /dev/sda2 arch
mount /dev/sda2 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
dd if=/dev/zero of=/mnt/swapfile bs=1M count=2048 status=progress
chmod 600 /mnt/swapfile
mkswap /mnt/swapfile
swapon /mnt/swapfile
pacstrap /mnt fish pacman git nano
genfstab -U /mnt >> /mnt/etc/fstab
cp -r ~/arch-install /mnt/arch-install
cp pacman.conf /mnt/etc/pacman.conf
cp package.txt /mnt/package.txt
cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
arch-chroot /mnt /bin/bash /arch-install/part2.sh
reboot
