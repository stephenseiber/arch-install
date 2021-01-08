git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -Rf yay
yay -S kalu-kde --noconfirm


