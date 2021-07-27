cp /arch-install/locale.gen /etc/locale.gen
locale-gen
ln -s /usr/share/zoneinfo/America/Denver /etc/localtime
pacman -Syyu - </package.txt --noconfirm
rm -r /package.txt
hwclock --systohc --utc
mkdir -p /etc/pacman.d/hooks
cp /arch-install/100-systemd-boot.hook /etc/pacman.d/hooks/100-systemd-boot.hook
bootctl install
cp /arch-install/loader.conf /boot/loader/loader.conf
cp /arch-install/reflector.conf /etc/xdg/reflector/reflector.conf
systemctl enable reflector
systemctl enable sddm
systemctl enable bluetooth
systemctl enable NetworkManager
chsh -s /bin/fish
pacman-key --init
pacman-key --populate archlinux
cp /arch-install/sudoers /etc/sudoers
echo name computer
read hostname
echo "${hostname}" > /etc/hostname
echo name user
read user
useradd -m -g users -G wheel -s /bin/fish $user
echo "what do you want your password to be?"
passwd $user
echo "what do you want root passwd to be"
passwd
echo passwd set
cp /arch-install/makepkgN.conf /etc/makepkg.conf;
cp /arch-install/homeN.tar.gz home.tar.gz;
cp /arch-install/yay.sh yay.sh;
pip install requests vdf;
sudo pacman -R amdvlk lib32-amdvlk --noconfirm;
cp /arch-install/mkinitcpio.conf /etc/mkinitcpio.conf;
cp /arch-install/nvidia.hook /etc/pacman.d/hooks/nvidia.hook;
cp /arch-install/archN.conf /boot/loader/entries/arch.conf;
mkinitcpio -p linux;       
echo this is still working
echo thumbs up
clear
rm -r /arch-install
echo done
exit
