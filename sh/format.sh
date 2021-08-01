devicelist=$(lsblk -dplnx size -o name,size | grep -Ev "boot|rpmb|loop" | tac)
device=$(dialog --stdout --menu "Select installation disk" 0 0 0 ${devicelist}) || exit 1
clear
parted --script "${device}" --  mklabel gpt \
  mkpart ESP fat32 1Mib 275MiB \
  set 1 boot on \
  mkpart primary ext4 275MiB 100%
part_boot="$(ls ${device}* | grep -E "^${device}p?1$")"
part_root="$(ls ${device}* | grep -E "^${device}p?2$")"
mkfs.vfat -F32 "${part_boot}"
mkfs.ext4 "${part_root}"
e2label "${part_root}" arch
mount "${part_root}" /mnt
mkdir /mnt/boot
mount "${part_boot}" /mnt/boot
echo desired swap size in Mib
read swap
dd if=/dev/zero of=/mnt/swapfile bs=1M count=$swap status=progress
chmod 600 /mnt/swapfile
mkswap /mnt/swapfile
swapon /mnt/swapfile
sh sh/pacstrap.sh
