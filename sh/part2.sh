locale-gen
ln -s /usr/share/zoneinfo/America/Denver /etc/localtime
hwclock --systohc --utc
bootctl install
systemctl enable reflector
systemctl enable sddm
systemctl enable bluetooth
systemctl enable NetworkManager
pacman -S virtualbox-guest-utils
modprobe -a vboxguest vboxsf vboxvideo
chsh -s /bin/fish
pacman-key --init
pacman-key --populate archlinux
pip install requests vdf
mkinitcpio -p linux       
sh /user.sh
rm -R /user.sh
exit
