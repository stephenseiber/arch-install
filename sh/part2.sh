reflector --latest 19 --verbose --protocol https --sort rate --save /etc/pacman.d/mirrorlist -c US --ipv6
pacman -Sy dialog --noconfirm
locale-gen
ln -s /usr/share/zoneinfo/America/Denver /etc/localtime
hwclock --systohc --utc
pacman -Syu - </packages --noconfirm
bootctl install
systemctl enable reflector
systemctl enable sddm
systemctl enable bluetooth
systemctl enable NetworkManager
systemctl enable cups
chsh -s /bin/fish
pacman-key --init
pacman-key --populate archlinux
pip install requests vdf
mkinitcpio -p linux       
sh /user.sh
rm -R /user.sh
rm -R /yay.sh
rm -R packages
exit
