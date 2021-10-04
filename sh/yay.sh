useradd -m -g users -G wheel -s /bin/fish yay
su yay
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
