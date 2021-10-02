cp copy/pacman.conf /etc/pacman.conf
reflector --latest 13 --verbose --protocol https --sort rate --save /etc/pacman.d/mirrorlist
pacman -Sy dialog pacredir --noconfirm
#systemctl start pacredir
ls /sys/firmware/efi/efivars
timedatectl set-ntp true
sh sh/format.sh
reboot
