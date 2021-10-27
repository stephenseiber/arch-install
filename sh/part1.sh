cp copy/pacman.conf /etc/pacman.conf
reflector --latest 50 --verbose --protocol https --sort rate --save /etc/pacman.d/mirrorlist -c US --ipv6
pacman -Sy dialog --noconfirm
ls /sys/firmware/efi/efivars
timedatectl set-ntp true
sh sh/format.sh
reboot
