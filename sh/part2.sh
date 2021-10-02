pacman -Sy dialog pacredir --noconfirm
#systemctl start pacredir
systemctl enable pacredir
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
pacman -S virtualbox-guest-utils --noconfirm
systemctl enable vboxservice
exit
