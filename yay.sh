git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -Rf yay
git clone https://aur.archlinux.org/kalu-kde.git
cd kalu-kde
makepkg -si --noconfirm
cd ..
rm -Rf kalu-kde
git clone https://aur.archlinux.org/jre8.git
cd jre8
makepkg -si --noconfirm
cd ..
rm -Rf jre8
git clone https://aur.archlinux.org/minecraft-launcher.git
cd minecraft-launcher
makepkg -si --noconfirm
cd ..
rm -Rf minecraft-launcher


