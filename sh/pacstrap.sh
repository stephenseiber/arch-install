pacstrap /mnt fish base linux linux-firmware git nano
genfstab -U /mnt >> /mnt/etc/fstab
sh sh/copy.sh
