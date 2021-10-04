cp copy/pacman.conf /etc/pacman.conf
# uncomment line below if running first time on only machine in a lan
reflector --latest 13 --verbose --protocol https --sort rate --save /etc/pacman.d/mirrorlist
pacman -Sy dialog --noconfirm
ls /sys/firmware/efi/efivars
timedatectl set-ntp true
sh sh/format.sh
reboot
