cp /arch-install/locale.gen /etc/locale.gen
locale-gen
ln -s /usr/share/zoneinfo/America/Denver /etc/localtime
pacman -Sy - </package.txt --noconfirm
cp /arch-install/makepkg /etc/makepkg.conf
hwclock --systohc --utc
mkdir -p /etc/pacman.d/hooks
cp /arch-install/100-systemd-boot.hook /etc/pacman.d/hooks/100-systemd-boot.hook
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
useradd -m -g users -G wheel -s /bin/fish $user
echo "what do you want your password to be?"
passwd $user
echo "what do you want root passwd to be"
passwd
echo passwd set
echo "${hostname}" > /etc/hostname
mkdir -p /home/$user/
mkdir -p /home/$user/Desktop
cd /home/$user/
cp /arch-install/yay.sh yay.sh
cp /arch-install/gaming.sh gaming.sh
cp /arch-install/home.tar.gz home.tar.gz
tar -xvf home.tar.gz 
rm -r home.tar.gz
chown -R $user /home/$user
/bin/su -c "sh yay.sh" - $user
echo first none root drive name? if not on gaming computer type no
read drivea
if [ $drivea == 'no' ] ;
    then echo "done";
    cp /arch-install/arch.conf /boot/loader/entries/arch.conf;
    rm -r /home/$user/.config/autostart/io.optimus_manager.OptimusManagerQt.desktop;
    else mkdir -p /home/$user//Desktop/$drivea
    devicelist=$(lsblk -dplnx size -o name,size | grep -Ev "boot|rpmb|loop" | tac) ;
    devicea=$(dialog --stdout --menu "Select drivea" 0 0 0 ${devicelist}) ;
    if [ ${devicea} == '/dev/sdb' ] || [ ${devicea} == '/dev/sda' ] ;
        then parta="${devicea}1";
        echo $parta is selected drive;
        uuid=$(blkid -o value -s UUID $parta);
        echo $uuid;
        echo "$uuid       /home/$user/Desktop/$drivea     ext4            rw,relatime     0 2" >> /etc/fstab;
        mount $parta /home/$user//Desktop/$drivea;
        /bin/su -c "sh gaming.sh" - $user;
        cp /arch-install/makepkgN.conf /etc/makepkg.conf; 
        pacman -S - </packageN.txt --noconfirm;
        cp /arch-install/mkinitcpio.conf /etc/mkinitcpio.conf;
        cp /arch-install/nvidia.hook /etc/pacman.d/hooks/nvidia.hook;
        cp /arch-install/archN.conf /boot/loader/entries/arch.conf;
        mkinitcpio -p linux;
        else parta="${devicea}p1";
        echo $parta is selected drive;
        mount $parta /home/$user//Desktop/$drivea;
        uuid=$(blkid -o value -s UUID $parta);
        echo $uuid;
        echo "$uuid       /home/$user/Desktop/$drivea     ext4            rw,relatime     0 2" >> /etc/fstab;
        /bin/su -c "sh gaming.sh" - $user;
        cp /arch-install/makepkgN.conf /etc/makepkg.conf; 
        pacman -S - </packageN.txt --noconfirm;
        cp /arch-install/mkinitcpio.conf /etc/mkinitcpio.conf;
        cp /arch-install/nvidia.hook /etc/pacman.d/hooks/nvidia.hook;
        cp /arch-install/archN.conf /boot/loader/entries/arch.conf;
        mkinitcpio -p linux;
    fi
fi

if [ $drivea == 'no' ] ;
    then echo "done" ;
    else echo second none drive name? if no second non root drive type no;
    read driveb
        if [ $driveb == 'no' ] ;
        then echo "done" ;/bin/su -c "sh yay.sh" - $user
        else mkdir -p /home/$user//Desktop/$driveb;
        devicelist=$(lsblk -dplnx size -o name,size | grep -Ev "boot|rpmb|loop" | tac) ;
        deviceb=$(dialog --stdout --menu "Select drivea" 0 0 0 ${devicelist}) ;
            if [ ${deviceb} == '/dev/sdb' ] || [ ${deviceb} == '/dev/sda' ] ;
            then partb="${deviceb}1";
            uuid=$(blkid -o value -s UUID $partb);
            echo $uuid;
            echo $partb is selected drive;
            mount $partb /home/$user/Desktop/$driveb;
            echo "$uuid       /home/$user/Desktop/$driveb     ext4            rw,relatime     0 2" >> /etc/fstab;
            else partb="${deviceb}p1";
            echo $partb is selected drive;
            mount $partb /home/$user//Desktop/$driveb;
            uuid=$(blkid -o value -s UUID $partb);
            echo $uuid;
            echo "$uuid       /home/$user/Desktop/$driveb     ext4            rw,relatime     0 2" >> /etc/fstab;
        fi
    fi
fi
echo this is still working
echo thumbs up
chown -R $user /home/$user
clear


fi
echo done

