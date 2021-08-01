mount -o remount,size=10G /run/archiso/cowspace
df -l
cp copy/pacman.conf /etc/pacman.conf
pacman -Sy reflector --noconfirm
ls /sys/firmware/efi/efivars
timedatectl set-ntp true
reflector --latest 10 --verbose --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sh sh/format1.sh
#sh sh/format.sh
#reboot
