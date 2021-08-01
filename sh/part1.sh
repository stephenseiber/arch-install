cp copy/pacman.conf /etc/pacman.conf
pacman -Sy dialog --noconfirm
ls /sys/firmware/efi/efivars
timedatectl set-ntp true
sh sh/format.sh
reboot
