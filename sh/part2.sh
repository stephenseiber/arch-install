pacman -Sy dialog pacredir --noconfirm
locale-gen
systemctl start pacredir
cp copy/pacman.conf /mnt/etc/pacman.conf
ln -s /usr/share/zoneinfo/America/Denver /etc/localtime
hwclock --systohc --utc
pacman -Syu - </packages --noconfirm
bootctl install
systemctl enable pacredir
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
exit
