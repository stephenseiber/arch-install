mount -o remount,size=1G /run/archiso/cowspace
df -l
cp copy/pacman.conf /etc/pacman.conf
pacman -Sy reflector dialog --noconfirm
ls /sys/firmware/efi/efivars
timedatectl set-ntp true
reflector --latest 10 --verbose --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sh sh/format.sh
reboot
