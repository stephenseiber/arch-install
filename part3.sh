cp /arch-install/locale.gen /etc/locale.gen
locale-gen
ln -s /usr/share/zoneinfo/America/Denver /etc/localtime
pacman -Sy - </package.txt --noconfirm
cp /arch-install/makepkg /etc/makepkg.conf
hwclock --systohc --utc
mkdir -p /etc/pacman.d/hooks
cp /arch-install/100-systemd-boot.hook
bootctl install
cp /arch-install/loader.conf /boot/loader/loader.conf
systemctl enable sddm
systemctl enable bluetooth
systemctl enable NetworkManager
chsh -s /bin/fish
pacman-key --init
pacman-key --populate archlinux
cp /arch-install/sudoers /etc/sudoers
echo name computer
read hostname
echo name user
read user
sudo useradd -m -g users -G wheel -s /bin/fish $user
echo "what do you want your password to be?"
passwd $user
echo "what do you want root passwd to be"
passwd
echo passwd set
useradd -m -g users -G wheel -s /bin/fish $user
echo "${hostname}" > /etc/hostname
devicelist=$(lsblk -dplnx size -o name,size | grep -Ev "boot|rpmb|loop" | tac)
device=$(dialog --stdout --menu "Select installation disk" 0 0 0 ${devicelist}) || exit 1
if [ ${device} == '/dev/sdb' ] || [ ${device} == '/dev/sda' ] ;
then cp /arch-install/arch.conf /boot/loader/entries/arch.conf ;
else sh partG.sh & cp /arch-install/archN.conf /boot/loader/entries/arch.conf;
fi
