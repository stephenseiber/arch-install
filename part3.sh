git clone https://github.com/stephenseiber/arch-install.git
cd /arch-install
cp /arch-install/locale.gen /etc/locale.gen
locale-gen
ln -s /usr/share/zoneinfo/America/Denver /etc/localtime
pacman -S - </package.txt --noconfirm
cp /arch-install/makepkg /etc/makepkg.conf
hwclock --systohc --utc
mkdir -p /etc/pacman.d/hooks
cp /arch-install/100-systemd-boot.hook
bootctl install
cp /arch-install/loader.conf /boot/loader/loader.conf
cp /arch-install/arch.conf /boot/loader/entries/arch.conf
systemctl enable sddm
systemctl enable bluetooth
systemctl enable NetworkManager
chsh -s /bin/fish
pacman-key --init
pacman-key --populate archlinux


