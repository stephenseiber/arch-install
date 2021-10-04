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
/bin/su -c "sh yay.sh" - $yay
userdel yay
