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
echo name user
read user
useradd -m -g users -G wheel -s /bin/fish $user
echo "what do you want your password to be?"
passwd $user
echo "what do you want root passwd to be"
passwd
echo passwd set
echo "${hostname}" > /etc/hostname
#mkdir -p /home/$user/
#cd /home/$user/
#cp /arch-install/yay.sh yay.sh
#/bin/su -c "sh yay.sh" - $user;
#rm -r yay.sh
echo is this gaming laptop
read gamer
if [ $gamer == no ]
then
cp /arch-install/makepkg /etc/makepkg.conf;
cp /arch-install/arch.conf /boot/loader/entries/arch.conf;
    else
    cp /arch-install/makepkgN.conf /etc/makepkg.conf;
    pacman -S - </packageN.txt --noconfirm;
    pip install requests vdf;
    cp /arch-install/mkinitcpio.conf /etc/mkinitcpio.conf;
    cp /arch-install/nvidia.hook /etc/pacman.d/hooks/nvidia.hook;
    cp /arch-install/archN.conf /boot/loader/entries/arch.conf;        
    rm -r /packageN.txt;
    mkinitcpio -p linux;
    echo first not root drive name?
    read drivea
    mkdir -p /home/$user/$drivea
    devicelist=$(lsblk -dplnx size -o name,size | grep -Ev "boot|rpmb|loop" | tac) ;
    devicea=$(dialog --stdout --menu "Select drivea" 0 0 0 ${devicelist}) ;
    if [ ${devicea} == '/dev/sdb' ] || [ ${devicea} == '/dev/sda' ] ;
        then parta="${devicea}1";
        echo $parta is selected drive;
        uuid=$(blkid -o value -s UUID $parta);
        echo $uuid;
        echo "UUID=$uuid       /home/$user/$drivea     ext4            rw,relatime     0 2" >> /etc/fstab;
        mount $parta /home/$user/$drivea;
        else parta="${devicea}p1";
        echo $parta is selected drive;
        mount $parta /home/$user//$drivea;
        uuid=$(blkid -o value -s UUID $parta);
        echo $uuid;
        echo "UUID=$uuid       /home/$user/$drivea     ext4            rw,relatime     0 2" >> /etc/fstab;

    fi
    echo second non root drive name? if no second non root drive type no;
    read driveb
        if [ $driveb == 'no' ] ;
        then echo "done" 
        else mkdir -p /home/$user/$driveb;
        devicelist=$(lsblk -dplnx size -o name,size | grep -Ev "boot|rpmb|loop" | tac) ;
        deviceb=$(dialog --stdout --menu "Select drivea" 0 0 0 ${devicelist}) ;
            if [ ${deviceb} == '/dev/sdb' ] || [ ${deviceb} == '/dev/sda' ] ;
            then partb="${deviceb}1";
            uuid=$(blkid -o value -s UUID $partb);
            echo $uuid;
            echo $partb is selected drive;
            mount $partb /home/$user/$driveb;
            echo "$UUID=$uuid       /home/$user/$driveb     ext4            rw,relatime     0 2" >> /etc/fstab;
            else partb="${deviceb}p1";
            echo $partb is selected drive;
            mount $partb /home/$user/$driveb;
            uuid=$(blkid -o value -s UUID $partb);
            echo $uuid;
            echo "UUID=$uuid       /home/$user/$driveb     ext4            rw,relatime     0 2" >> /etc/fstab;
        fi
    fi
fi
echo this is still working
echo thumbs up
chown -R $user /home/$user
clear
rm -r /arch-install
echo done
exit
