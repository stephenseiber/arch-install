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


