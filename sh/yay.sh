mkdir -p /tmp/yay
cd /tmp/yay
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si --noconfirm
mkdir -p /tmp/epson
cd /tmp/epson
git clone https://aur.archlinux.org/epson-inkjet-printer-escpr.git
cd epson-inkjet-printer-escpr/
makepkg -si --noconfirm
mkdir -p /tmp/ttf-ms-fonts
cd /tmp/ttf-ms-fonts
git clone https://aur.archlinux.org/ttf-ms-fonts.git
cd ttf-ms-fonts/
makepkg -si --noconfirm
touch panel-restart
echo '#!/bin/bash' > panel-restart
echo 'killall plasmashell;plasmashell &' >> panel-restart
sudo chmod +x panel-restart
sudo mv panel-restart /usr/bin/
touch reflector-update
echo '#!/bin/bash' > reflector-update
echo 'sudo reflector --latest 50 --verbose --protocol https --sort rate --save /etc/pacman.d/mirrorlist -c US --ipv6' >> reflector-update
sudo chmod +x reflector-update
sudo mv reflector-update /usr/bin
