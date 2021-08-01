# arch-install
just my personal arch linux installation script
to use script 

reflector --latest 10 --verbose --protocol https --sort rate --save /etc/pacman.d/mirrorlist
pacman -Sy git
git clone https://github.com/stephenseiber/arch-install.git
cd arch-install
sh begin.sh
