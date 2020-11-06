git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -Rf yay
git clone https://aur.archlinux.org/alpm_octopi_utils.git
cd alpm_octopi_utils
makepkg -si --noconfirm
cd ..
rm -Rf alpm_octopi_utils
git clone https://aur.archlinux.org/octopi.git
cd octopi
makepkg -si --noconfirm
cd ..
rm -Rf octopi
git clone https://aur.archlinux.org/octopi-notifier-frameworks.git
cd octopi-notifier-frameworks
makepkg -si --noconfirm
cd ..
rm -Rf octopi-notifier-frameworks
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


