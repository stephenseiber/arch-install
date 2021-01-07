
mount -o remount,size=4G /run/archiso/cowspace
df -l
pacman -Sy reflector dialog --noconfirm

ls /sys/firmware/efi/efivars
timedatectl set-ntp true
reflector --latest 50 --verbose  --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
pacman -Sy
lsblk
echo is this device coming off of windows
read Windows
if [ Windows == 'yes' ]
    then echo "backup not possible"
    else 
    devicelist=$(lsblk -dplnx size -o name,size | grep -Ev "boot|rpmb|loop" | tac);
    device1=$(dialog --stdout --menu "drive to backup" 0 0 0 ${devicelist}) || exit 1;
    devicelist=$(lsblk -dplnx size -o name,size | grep -Ev "boot|rpmb|loop" | tac);
    device2=$(dialog --stdout --menu "backup" 0 0 0 ${devicelist}) || exit 1;
    if [ ${device1} == '/dev/sdb' ] || [ ${device1} == '/dev/sda' ] ;then pr1="${device1}2"  ;else pr1="${device1}p2"; fi;
    if [ ${device2} == '/dev/sdb' ] || [ ${device2} == '/dev/sda' ] ;then pr2="${device2}3"  ;else pr2="${device2}p3"; fi;
    mkdir -p /a;
    mkdir -p /b;
    mount $pr1 /a;
    mount $pr2 /b;
    tar -czvf /b/backup.tar.gz /a/home;
    unmount a;
    echo "backup complete"
    fi
echo select installation drive
devicelist=$(lsblk -dplnx size -o name,size | grep -Ev "boot|rpmb|loop" | tac);
device=$(dialog --stdout --menu "installation drive" 0 0 0 ${devicelist}) || exit 1;
clear
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
cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
if [ Windows == 'yes' ]
  echo "no backup"
  else
  cd /mnt;
  tar -xvf /b/backup.tar.gz;
fi
arch-chroot /mnt /bin/bash /arch-install/part2.sh
reboot
