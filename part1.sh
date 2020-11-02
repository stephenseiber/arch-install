mount -o remount,size=4G /run/archiso/cowspace
df -l
pacman -Sy reflector --noconfirm

ls /sys/firmware/efi/efivars
timedatectl set-ntp true
reflector --verbose -l 10 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Sy
lsblk
devicelist=$(lsblk -dplnx size -o name,size | grep -Ev "boot|rpmb|loop" | tac)
device=$(dialog --stdout --menu "Select installation disk" 0 0 0 ${devicelist}) || exit 1
parted --script "${device}" -- mklabel gpt \
  mkpart ESP fat32 1Mib 275MiB \
  set 1 boot on \
  mkpart primary ext4 275MiB 100%
  
if [ ${device} == '/dev/sdb' ] || [ ${device} == '/dev/sda' ] ;then pr="${device}2"  ;else pr="${device}p2"; fi
if [ ${device} == '/dev/sdb' ] || [ ${device} == '/dev/sda' ] ;then pb="${device}1"  ;else pb="${device}p1" ;fi
echo $pb is boot part and $pr is root part
wipefs "$pr"
wipefs "$pb"
mkfs.vfat -F32 "$pb"
mkfs.ext4  "$pr"
e2label "$pr" arch
e2label "$pb" boot
mount $pr /mnt
mkdir -p /mnt/boot
mount $pb /mnt/boot
dd if=/dev/zero of=/mnt/swapfile bs=1M count=1024 status=progress
chmod 600 /mnt/swapfile
mkswap /mnt/swapfile
swapon /mnt/swapfile
pacstrap /mnt fish pacman git nano
genfstab -U /mnt >> /mnt/etc/fstab
cp -r ~/arch-install /mnt/arch-install
cp pacman.conf /mnt/etc/pacman.conf
cp package.txt /mnt/package.txt
cp packageN.txt /mnt/packageN.txt
reflector --verbose -l 10 --sort rate --save /mnt/etc/pacman.d/mirrorlist
arch-chroot /mnt /bin/bash /arch-install/part2.sh
