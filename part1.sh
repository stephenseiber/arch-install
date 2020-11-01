mount -o remount,size=4G /run/archiso/cowspace
df -l
pacman -Sy reflector fish --noconfirm
fish
ls /sys/firmware/efi/efivars
timedatectl set-ntp true
reflector --verbose -l 10 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Sy
lsblk
