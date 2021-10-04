cp copy/pacman.conf /etc/pacman.conf
reflector --latest 15 --verbose --protocol https --sort rate --save /etc/pacman.d/mirrorlist
pacman -Sy dialog --noconfirm
ls /sys/firmware/efi/efivars
timedatectl set-ntp true
sh sh/format.sh
reboot
