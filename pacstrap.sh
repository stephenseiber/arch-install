pacstrap /mnt fish base linux linux-firmware git nano pipewire-pulse lib32-vulkan-intel vulkan-intel reflector base-devel plasma-meta plasma-wayland-session steam-native-runtime intel-ucode ntfs-3g vlc bluez bluez-utils wget discord vulkan-tools wine-staging lutris winetricks pavucontrol vivaldi vivaldi-ffmpeg-codecs kde-utilities-meta kde-system-meta cups system-config-printer qbittorrent nvidia lib32-nvidia-utils lib32-opencl-nvidia nvidia-settings python-pip opencl-nvidia ppsspp lib32-vkd3d vkd3d nvidia-prime spectacle budgie-desktop xfce4 xfce4-goodies libreoffice-fresh knotes
genfstab -U /mnt >> /mnt/etc/fstab
sh copy.sh